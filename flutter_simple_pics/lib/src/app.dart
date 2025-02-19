import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'models/image_model.dart';

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

  void fetchImage() async {
    counter++;

    try {
      http.Response response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));

      if (response.statusCode != 200) {
        showSnackBar('Failed to load image');
        return;
      }

      var imageModel = ImageModel.fromJson(json.decode(response.body));

      // This function updates the state of the widget by adding a new image to the
      // list of images. It is necessary to call this function whenever a new image
      // is added so that the app can display the new image on the screen. Without
      // this update, the new image would not appear in the app's UI.
      setState(() {
        images.add(imageModel);
      });
    } catch (e) {
      showSnackBar('Error: $e');
    }
  }

  void showSnackBar(String message) {
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
      body: Text('$counter'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
    );
  }
}
