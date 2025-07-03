import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/widgets/widgets.dart';

/// The main screen that displays a scrollable list of Hacker News stories.
///
/// This widget creates a screen with:
/// - An app bar with the title "Top News" and a refresh button
/// - A scrollable list of news stories fetched from the Hacker News API
/// - Loading indicators while stories are being downloaded
/// - Error messages with retry functionality if something goes wrong
/// - Pagination (automatic loading of more stories when you scroll down)
///
/// **How it works:**
/// 1. When the screen loads, it automatically starts downloading top stories
/// 2. As stories are downloaded, they appear in the list one by one
/// 3. When you scroll near the bottom, it automatically loads more stories
/// 4. If there's a network error, it shows an error message with a retry button
///
/// This is a **StatefulWidget**, which means it can change and update over time
/// (like when new stories are loaded or when you scroll through the list).
class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

/// The internal state management class for the NewsList widget.
///
/// This class handles:
/// - Managing the scroll position and detecting when to load more stories
/// - Connecting to the data source (StoriesBloc) to get news stories
/// - Building different parts of the user interface based on the current state
/// - Cleaning up resources when the screen is closed
class _NewsListState extends State<NewsList> {
  /// Controls the scrolling behavior of the news list.
  ///
  /// Think of this as a remote control for the list - it lets us:
  /// - Know how far the user has scrolled
  /// - Detect when they're near the bottom (to load more stories)
  /// - Control the scrollbar visibility on desktop computers
  ///
  /// We create this once and reuse it throughout the widget's lifetime.
  final ScrollController _scrollController = ScrollController();

  /// This method runs once when the widget is first created and added to the screen.
  ///
  /// It's like the "startup" method for this screen. Here we:
  /// 1. Set up a listener to detect when the user scrolls (for pagination)
  /// 2. Tell our data source (StoriesBloc) to start downloading stories
  ///
  /// **Why we use addPostFrameCallback:**
  /// We can't access the StoriesProvider immediately when initState runs,
  /// because the widget tree isn't fully built yet. So we schedule our
  /// initialization to run after the first frame is drawn.
  @override
  void initState() {
    super.initState();
    // Start loading stories when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = StoriesProvider.of(context);
      bloc.fetchTopIds();
    });

    // Add scroll listener for pagination
    _scrollController.addListener(_onScroll);
  }

  /// Detects when the user has scrolled near the bottom of the list.
  ///
  /// This method is called every time the user scrolls. When they reach
  /// 80% of the way down the list, we automatically load more stories.
  ///
  /// **How it works:**
  /// - `pixels` = how far down the user has scrolled
  /// - `maxScrollExtent` = the total scrollable distance
  /// - When pixels >= 80% of maxScrollExtent, load more stories
  ///
  /// This creates a seamless "infinite scroll" experience where new content
  /// loads automatically as you scroll down.
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      // Load more stories when user scrolls to 80% of the list
      final bloc = StoriesProvider.of(context);
      bloc.loadMoreStories();
    }
  }

  /// Cleans up resources when this screen is removed from memory.
  ///
  /// This is like a "cleanup" method that runs when the user navigates away
  /// from this screen. We need to dispose of the scroll controller to prevent
  /// memory leaks (where unused objects stay in memory forever).
  ///
  /// **Why this matters:**
  /// If we don't clean up properly, the app will slowly use more and more
  /// memory over time, eventually becoming slow or crashing.
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Builds the main user interface for this screen.
  ///
  /// This method is called whenever Flutter needs to redraw the screen
  /// (which happens frequently as data changes or user interactions occur).
  ///
  /// **The structure:**
  /// 1. **Scaffold** - The basic screen structure (like a page template)
  /// 2. **AppBar** - The top navigation area with title and refresh button
  /// 3. **StreamBuilder** - Listens for data changes and rebuilds content
  ///
  /// **StreamBuilder explained:**
  /// Think of it like a smart container that automatically updates its contents
  /// whenever new data arrives. It's like a TV that automatically changes
  /// channels when a new signal comes in.
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => bloc.refresh(),
          ),
        ],
      ),
      body: StreamBuilder<List<ItemModel>>(
        stream: bloc.stories,
        builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildLoadingWidget(bloc);
          }

          return _buildList(snapshot.data!);
        },
      ),
    );
  }

  /// Creates the scrollable list of news stories.
  ///
  /// This method builds the main content area containing all the news stories.
  /// It includes:
  /// - A **Scrollbar** for desktop users (like a scroll indicator on the right)
  /// - A **ListView.builder** that efficiently creates story items as needed
  ///
  /// **ListView.builder efficiency:**
  /// Instead of creating all 500 stories at once (which would be slow),
  /// it only creates the ones currently visible on screen. As you scroll,
  /// it creates new ones and removes old ones - this keeps the app fast
  /// even with thousands of stories.
  Widget _buildList(List<ItemModel> stories) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return _buildStoryItem(story, index);
        },
      ),
    );
  }

  /// Creates a single news story item for display in the list.
  ///
  /// This method now uses the extracted StoryListItem widget for better
  /// code organization and reusability.
  Widget _buildStoryItem(ItemModel story, int index) {
    return StoryListItem(
      story: story,
      index: index,
      onTap: () => _handleStoryTap(story),
    );
  }

  /// Shows a loading screen while stories are being downloaded.
  ///
  /// This method now uses the extracted LoadingStateWidget for better
  /// code organization and reusability.
  Widget _buildLoadingWidget(bloc) {
    return LoadingStateWidget(
      loadingStream: bloc.loading,
    );
  }

  /// Displays an error message when something goes wrong.
  ///
  /// This method now uses the extracted ErrorStateWidget for better
  /// code organization and reusability.
  Widget _buildErrorWidget(String error) {
    return ErrorStateWidget(
      error: error,
      onRetry: () {
        final bloc = StoriesProvider.of(context);
        bloc.refresh();
      },
    );
  }

  /// Handles what happens when a user taps on a story.
  ///
  /// **Current behavior:**
  /// For now, we just show a temporary message (SnackBar) at the bottom
  /// of the screen with the story title.
  ///
  /// **Future enhancements (marked as TODO):**
  /// - Navigate to a detailed story page
  /// - Open the story URL in a web browser
  /// - Share the story with other apps
  /// - Save the story for offline reading
  ///
  /// **SnackBar explained:**
  /// A SnackBar is like a temporary notification that slides up from the
  /// bottom of the screen, shows a message, then disappears automatically.
  /// It's non-intrusive and doesn't block the user from continuing to
  /// use the app.
  void _handleStoryTap(ItemModel story) {
    // TODO: Navigate to story detail page or open URL
    if (story.url != null) {
      // For now, just show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Opening: ${story.title}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
