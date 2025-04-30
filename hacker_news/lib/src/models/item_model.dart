import 'dart:convert';

/// A model representing an "Item" from the HackerNews API.
///
/// This class is used to deserialize JSON data from the HackerNews API into a
/// Dart object. It includes all the fields documented in the API.
class ItemModel {
  final int id;
  final bool? deleted;
  final String? type;
  final String? by;
  final int? time;
  final String? text;
  final bool? dead;
  final int? parent;
  final List<int>? kids;
  final String? url;
  final int? score;
  final String? title;
  final List<int>? parts;
  final int? descendants;

  /// Constructor for the `ItemModel` class.
  ///
  /// All fields are required except those marked as nullable.
  ItemModel({
    required this.id,
    this.deleted,
    this.type,
    this.by,
    this.time,
    this.text,
    this.dead,
    this.parent,
    this.kids,
    this.url,
    this.score,
    this.title,
    this.parts,
    this.descendants,
  });

  /// Factory constructor to create an `ItemModel` from a JSON map.
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      deleted: json['deleted'],
      type: json['type'],
      by: json['by'],
      time: json['time'],
      text: json['text'],
      dead: json['dead'],
      parent: json['parent'],
      kids: (json['kids'] as List<dynamic>?)?.cast<int>(),
      url: json['url'],
      score: json['score'],
      title: json['title'],
      parts: (json['parts'] as List<dynamic>?)?.cast<int>(),
      descendants: json['descendants'],
    );
  }

  /// Converts the `ItemModel` instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deleted': deleted,
      'type': type,
      'by': by,
      'time': time,
      'text': text,
      'dead': dead,
      'parent': parent,
      'kids': kids,
      'url': url,
      'score': score,
      'title': title,
      'parts': parts,
      'descendants': descendants,
    };
  }

  /// Creates a copy of the `ItemModel` with updated fields.
  ItemModel copyWith({
    int? id,
    bool? deleted,
    String? type,
    String? by,
    int? time,
    String? text,
    bool? dead,
    int? parent,
    int? poll,
    List<int>? kids,
    String? url,
    int? score,
    String? title,
    List<int>? parts,
    int? descendants,
  }) {
    return ItemModel(
      id: id ?? this.id,
      deleted: deleted ?? this.deleted,
      type: type ?? this.type,
      by: by ?? this.by,
      time: time ?? this.time,
      text: text ?? this.text,
      dead: dead ?? this.dead,
      parent: parent ?? this.parent,
      kids: kids ?? this.kids,
      url: url ?? this.url,
      score: score ?? this.score,
      title: title ?? this.title,
      parts: parts ?? this.parts,
      descendants: descendants ?? this.descendants,
    );
  }

  /// Converts the `ItemModel` instance to a JSON string.
  String toJsonString() => json.encode(toJson());

  /// Creates an `ItemModel` instance from a JSON string.
  factory ItemModel.fromJsonString(String jsonString) {
    return ItemModel.fromJson(json.decode(jsonString));
  }
}
