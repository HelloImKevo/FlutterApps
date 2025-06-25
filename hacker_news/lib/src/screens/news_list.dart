import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    final ScrollController scrollController = ScrollController();

    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView.builder(
        controller: scrollController,
        itemCount: 1000, // Example item count
        itemBuilder: (context, int index) {
          return FutureBuilder(
            future: getFuture(),
            builder: (context, snapshot) {
              return Card(
                elevation: 3.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 60.0,
                  child: snapshot.hasData
                      ? Text('Im visible $index')
                      : Text('I havent fetched data yet $index'),
                ),
              );
            },
          );
        },
      ),
    );
  }

  getFuture() {
    // Simulate a network call or data fetching
    return Future.delayed(
      const Duration(seconds: 2),
      () => {'News Item'},
    );
  }
}
