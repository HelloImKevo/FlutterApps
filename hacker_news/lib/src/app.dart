import 'package:flutter/material.dart';
import 'package:hacker_news/src/screens/news_list.dart';
import 'package:hacker_news/src/blocs/stories_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Hacker News',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const NewsList(),
      ),
    );
  }
}
