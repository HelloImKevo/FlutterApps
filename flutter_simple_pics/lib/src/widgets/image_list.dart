import 'package:flutter/material.dart';
import '../models/image_model.dart';
import '../dimensions.dart';

/// A stateless widget that displays a list of images in a scrollable view.
///
/// The [ImageList] widget takes a list of [ImageModel] objects and displays
/// each image in a card with its title. The images are fetched from the network
/// using their URLs.
///
/// This widget is useful for displaying a collection of images in a vertical
/// list format, where each image is accompanied by a title.
///
/// Example usage:
/// ```dart
/// ImageList(
///   images: [
///     ImageModel(url: 'https://example.com/image1.jpg', title: 'Image 1'),
///     ImageModel(url: 'https://example.com/image2.jpg', title: 'Image 2'),
///   ],
/// )
/// ```
///
/// The [images] parameter must not be null and should contain a list of
/// [ImageModel] objects.
class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  /// Creates an instance of the ImageList widget.
  ///
  /// The [images] parameter is required and must be provided when creating
  /// an ImageList. It represents a collection of images that will be displayed
  /// by this widget.
  ///
  /// The [key] parameter is optional and can be used to uniquely identify
  /// this widget in the widget tree.
  ///
  /// The `super` instruction calls the constructor of the parent class,
  /// ensuring the widget is properly initialized with the provided [key]
  /// parameter for unique identification within the widget tree.
  const ImageList({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return buildImage(context, images[index]);
      },
    );
  }

  Widget buildImage(BuildContext context, ImageModel image) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            padding: AppDimensions.paddingSmall(context),
            margin: AppDimensions.marginMedium(context),
            child: Image.network(image.url),
          ),
          Padding(
            padding: AppDimensions.paddingSmall(context),
            child: Text(image.title),
          ),
        ],
      ),
    );
  }
}
