class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  /// Creates an instance of [ImageModel] from a JSON object.
  ///
  /// This constructor takes a [Map] of key-value pairs, where the keys are
  /// strings and the values are dynamic, and initializes an [ImageModel]
  /// object with the values from the JSON.
  ///
  /// The colon (:) operator, known as the initializer list, is used here to
  /// initialize the fields of the class with the values from the JSON map.
  /// It allows you to set instance variables before the constructor body runs.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   'id': 1,
  ///   'url': 'https://example.com/image.jpg',
  ///   'title': 'An example image'
  /// };
  /// ImageModel image = ImageModel.fromJson(json);
  /// ```
  ///
  /// - `parsedJson`: A [Map] containing the JSON data with keys 'id', 'url',
  ///   and 'title'.
  ImageModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        url = parsedJson['url'],
        title = parsedJson['title'];
}
