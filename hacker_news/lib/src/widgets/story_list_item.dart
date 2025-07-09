import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/item_model.dart';

/// A single news story item widget for display in a list.
///
/// This widget creates a **Card** (a Material Design component that looks like
/// a piece of paper with a subtle shadow) containing story information.
///
/// **What's displayed:**
/// - **Title** - The story headline (bold text)
/// - **Author** - Who posted the story
/// - **Score** - How many upvotes the story has received
/// - **Domain** - The website where the story was published (if available)
///
/// **Interaction:**
/// When tapped, it calls the provided `onTap` callback to handle navigation
/// or other actions.
class StoryListItem extends StatelessWidget {
  /// The story data to display
  final ItemModel story;

  /// The position of this item in the list (for potential future use)
  final int index;

  /// Callback function when the story item is tapped
  final VoidCallback? onTap;

  const StoryListItem({
    super.key,
    required this.story,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.comment,
              color: Colors.grey[600],
              size: 24.0,
            ),
            const SizedBox(height: 4.0),
            Text(
              '${story.descendants ?? 0}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  /// Extracts the domain name from a full URL.
  ///
  /// **Example:**
  /// - Input: "https://www.example.com/article/123?ref=homepage"
  /// - Output: "www.example.com"
  ///
  /// **Why we do this:**
  /// Full URLs can be very long and ugly in the UI. By showing just the
  /// domain, users can quickly see which website the story comes from
  /// without cluttering the interface.
  ///
  /// **Error handling:**
  /// If the URL is malformed or can't be parsed, we just return the
  /// original URL instead of crashing the app.
  String _extractDomain(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.host;
    } catch (e) {
      return url;
    }
  }
}
