import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:niceoogling/descendants/recipe.dart';

const baseurl = '127.0.0.1:3000';

class Tastydescendant {
  static const _autocomplete = '/tastydescendant/autocomplete',
      _detailrecipe = '/tastydescendant/detailrecipe',
      _listrecipes = '/tastydescendant/listrecipes',
      _listtags = '/tastydescendant/listtags',
      _listfeeds = '/tastydescendant/listfeeds',
      _listsimilarities = '/tastydescendant/listsimilarities';

  static Future<List<dynamic>> autocomplete() async {
    final response = await http.get(Uri.https(baseurl, _autocomplete));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = [];
      values = json.decode(response.body);
      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<dynamic>> detailrecipe() async {
    final response = await http.get(Uri.https(baseurl, _detailrecipe));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = [];
      values = json.decode(response.body);
      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Recipe>> listrecipes({int from = 0, int size = 6}) async {
    http.Response response = await http.get(Uri.http(baseurl, _listrecipes,
        {'from': from.toString(), 'size': size.toString()}));
    if (response.statusCode == 200) {
      List<Recipe> list = [];
      (json.decode(response.body)['results'] as List<dynamic>)
          .forEach((e) => list.add(Recipe.fromJson(e)));
      return list;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<dynamic>> listtags() async {
    final response = await http.get(Uri.https(baseurl, _listtags));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = [];
      values = json.decode(response.body);
      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<dynamic>> listfeeds() async {
    final response = await http.get(Uri.https(baseurl, _listfeeds));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = [];
      values = json.decode(response.body);
      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<dynamic>> listsimilarities() async {
    final response = await http.get(Uri.https(baseurl, _listsimilarities));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = [];
      values = json.decode(response.body);
      return values;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
