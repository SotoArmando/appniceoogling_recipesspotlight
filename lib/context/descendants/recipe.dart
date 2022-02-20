import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class Recipe {
  final String name;
  final String? description;
  final String? video_url;
  final String? original_video_url;
  final int created_at;
  final thumbnail_url;
  final int updated_at;

  const Recipe({
    required this.name,
    required this.description,
    required this.video_url,
    required this.original_video_url,
    required this.created_at,
    required this.updated_at,
    required this.thumbnail_url,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      description: json['description'],
      video_url: json['video_url'],
      original_video_url: json['original_video_url'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      thumbnail_url: json['thumbnail_url'],
    );
  }
}
