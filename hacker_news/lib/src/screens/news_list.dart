import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/stories_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

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

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      // Load more stories when user scrolls to 80% of the list
      final bloc = StoriesProvider.of(context);
      bloc.loadMoreStories();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        builder: (context, snapshot) {
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

  Widget _buildStoryItem(ItemModel story, int index) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          story.title ?? 'No Title',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(
              'by ${story.by ?? 'Unknown'} • ${story.score ?? 0} points',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
            if (story.url != null) ...[
              const SizedBox(height: 4.0),
              Text(
                _extractDomain(story.url!),
                style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 12.0,
                ),
              ),
            ],
          ],
        ),
        onTap: () => _handleStoryTap(story),
      ),
    );
  }

  Widget _buildLoadingWidget(bloc) {
    return StreamBuilder<bool>(
      stream: bloc.loading,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;

        if (isLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16.0),
                Text('Loading top stories...'),
              ],
            ),
          );
        }

        return const Center(
          child: Text('No stories available'),
        );
      },
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64.0,
              color: Colors.red,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Failed to load stories',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final bloc = StoriesProvider.of(context);
                bloc.refresh();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  String _extractDomain(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.host;
    } catch (e) {
      return url;
    }
  }

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
