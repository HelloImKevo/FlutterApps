import 'package:flutter/material.dart';

/// A widget that displays loading states and empty states for the news list.
///
/// This widget handles different loading scenarios:
/// - **Loading** - Shows a spinning circle and "Loading..." text
/// - **No Stories** - Shows "No stories available" if nothing loaded
///
/// **StreamBuilder pattern:**
/// This widget is designed to work with streams that provide loading state
/// information, allowing real-time updates as data is being fetched.
class LoadingStateWidget extends StatelessWidget {
  /// Stream that provides the current loading state
  final Stream<bool>? loadingStream;

  /// Optional custom loading message
  final String loadingMessage;

  /// Optional custom empty state message
  final String emptyMessage;

  const LoadingStateWidget({
    super.key,
    this.loadingStream,
    this.loadingMessage = 'Loading top stories...',
    this.emptyMessage = 'No stories available',
  });

  @override
  Widget build(BuildContext context) {
    if (loadingStream != null) {
      return StreamBuilder<bool>(
        stream: loadingStream,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          final isLoading = snapshot.data ?? false;

          if (isLoading) {
            return _buildLoadingWidget();
          }

          return _buildEmptyWidget();
        },
      );
    }

    return _buildEmptyWidget();
  }

  /// Creates the loading spinner and message
  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16.0),
          Text(loadingMessage),
        ],
      ),
    );
  }

  /// Creates the empty state message
  Widget _buildEmptyWidget() {
    return Center(
      child: Text(emptyMessage),
    );
  }
}

/// A widget that displays error states with retry functionality.
///
/// This screen appears when:
/// - The internet connection is lost
/// - The Hacker News API is down
/// - There's a bug in our code
/// - The device can't connect to the server
///
/// **User-friendly error handling:**
/// Instead of showing cryptic error codes, we show:
/// - A clear error icon (red exclamation mark)
/// - A simple message: "Failed to load stories"
/// - The technical error details (for debugging)
/// - A "Retry" button to try loading again
class ErrorStateWidget extends StatelessWidget {
  /// The error message to display
  final String error;

  /// Callback function when the retry button is pressed
  final VoidCallback? onRetry;

  /// Optional custom error title
  final String errorTitle;

  /// Optional custom retry button text
  final String retryButtonText;

  const ErrorStateWidget({
    super.key,
    required this.error,
    this.onRetry,
    this.errorTitle = 'Failed to load stories',
    this.retryButtonText = 'Retry',
  });

  @override
  Widget build(BuildContext context) {
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
            Text(
              errorTitle,
              style: const TextStyle(
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
            if (onRetry != null) ...[
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(retryButtonText),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
