import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

final logger = Logger();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  List<ImageModel> images = [];

  // In Dart, the async and await keywords are used to handle asynchronous
  // operations. When you use await in an async function, Dart does not block
  // the main thread. Instead, it allows other code to run while waiting for
  // the asynchronous operation to complete. This means that the network call
  // in the fetchImage function is not blocking the main thread, even though
  // it appears to be running on the main thread.

  // However, if you want to explicitly offload the network call to a background
  // thread, you can use the compute function from the flutter/foundation.dart
  // package. The compute function runs the provided function in a background
  // isolate and returns the result to the main isolate.

  // Function to perform the network call and parse the response
  static Future<ImageModel> fetchImageFromNetwork(int counter) async {
    String url = 'https://jsonplaceholder.typicode.com/photos/$counter';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load image');
    }

    return ImageModel.fromJson(json.decode(response.body));
  }

  void fetchImage() async {
    counter++;

    String url = 'https://jsonplaceholder.typicode.com/photos/$counter';

    try {
      // Use compute to run fetchImageFromNetwork in a background isolate.
      ImageModel imageModel = await compute(fetchImageFromNetwork, counter);

      // http.Response response = await http.get(Uri.parse(url));

      // if (response.statusCode != 200) {
      //   showSnackBar('Failed to load image');
      //   return;
      // }

      // var imageModel = ImageModel.fromJson(json.decode(response.body));

      logger.d("Image loaded: ${imageModel.url}");

      // This function updates the state of the widget by adding a new image to the
      // list of images. It is necessary to call this function whenever a new image
      // is added so that the app can display the new image on the screen. Without
      // this update, the new image would not appear in the app's UI.
      setState(() {
        images.add(imageModel);
      });
    } catch (e) {
      showSnackBar('Error loading $url\n$e');
    }
  }

  void showSnackBar(String message) {
    logger.w(message);

    // Check if the widget is still mounted before attempting to show a SnackBar.
    // This is necessary because the fetchImage function is asynchronous and the
    // widget might have been disposed of before the function completes.
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.seeSomeImages),
      ),
      body: ImageList(images: images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
