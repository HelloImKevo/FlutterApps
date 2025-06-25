import 'package:flutter/material.dart';
import 'package:hacker_news/src/screens/news_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: NewsList(),
    );
  }
}
