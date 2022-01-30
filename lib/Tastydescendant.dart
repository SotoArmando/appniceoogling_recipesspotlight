import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:niceoogling/descendants/recipe.dart';

const baseurl = '127.0.0.1:3000';

class Tastydescendant extends ChangeNotifier {
  List<Recipe> _homepagefeature0 = [];
  List<Recipe> _homepagefeed0 = [];
  List<Recipe> _homepagefeed1 = [];
  List<Recipe> _homepagefeed2 = [];
  List<Recipe> _homepagefeed3 = [];

  bool loaded_homepagefeature0 = false;

  UnmodifiableListView<Recipe> get homepagefeature0 =>
      UnmodifiableListView(_homepagefeature0);
  UnmodifiableListView<Recipe> get homepagefeed0 =>
      UnmodifiableListView(_homepagefeed0);
  UnmodifiableListView<Recipe> get homepagefeed1 =>
      UnmodifiableListView(_homepagefeed1);
  UnmodifiableListView<Recipe> get homepagefeed2 =>
      UnmodifiableListView(_homepagefeed2);
  UnmodifiableListView<Recipe> get homepagefeed3 =>
      UnmodifiableListView(_homepagefeed3);

  static const _autocomplete = '/tastydescendant/autocomplete',
      _detailrecipe = '/tastydescendant/detailrecipe',
      _listrecipes = '/tastydescendant/listrecipes',
      _listtags = '/tastydescendant/listtags',
      _listfeeds = '/tastydescendant/listfeeds',
      _listsimilarities = '/tastydescendant/listsimilarities';

  void loadhomepagefeatures() {
    if (loaded_homepagefeature0 == false) {
      listrecipes(from: 56, size: 4)
          .then((value) => _homepagefeature0 = value)
          .then((value) => notifyListeners());
      listrecipes(from: 31, size: 4)
          .then((value) => _homepagefeed0 = value)
          .then((value) => notifyListeners());
      listrecipes(from: 36, size: 4)
          .then((value) => _homepagefeed1 = value)
          .then((value) => notifyListeners());
      listrecipes(from: 19, size: 4)
          .then((value) => _homepagefeed2 = value)
          .then((value) => notifyListeners());
      listrecipes(from: 46, size: 4)
          .then((value) => _homepagefeed3 = value)
          .then((value) => notifyListeners());

      loaded_homepagefeature0 = true;
    }
  }

  Future<List<dynamic>> autocomplete() async {
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

  Future<List<dynamic>> detailrecipe() async {
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

  static Future<List<Recipe>> listrecipes(
      {int from = 0, int size = 6, String tags = ""}) async {
    http.Response response = await http.get(Uri.http(baseurl, _listrecipes,
        {'from': from.toString(), 'size': size.toString(), 'tags': tags}));
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

  Future<List<dynamic>> listtags() async {
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

  Future<List<dynamic>> listfeeds() async {
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

  Future<List<dynamic>> listsimilarities() async {
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
