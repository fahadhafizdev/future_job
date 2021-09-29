import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_job/models/posted.dart';
import 'package:http/http.dart' as http;

class PostedProvider with ChangeNotifier {
  Future<List<Posted>> getPosted() async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/jobs'),
      );

      print('stauscode posted: ${response.statusCode}');
      print('body : ${response.body}');

      if (response.statusCode == 200) {
        List<Posted> posted = [];
        List data = jsonDecode(response.body);

        data.forEach((postedItem) {
          posted.add(Posted.fromJson(postedItem));
        });

        return posted;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Posted>> getPostedByCategory(String category) async {
    try {
      var response = await http.get(
        Uri.parse('https://bwa-jobs.herokuapp.com/jobs?category=$category'),
      );

      print('stauscode posted: ${response.statusCode}');
      print('body : ${response.body}');

      if (response.statusCode == 200) {
        List<Posted> posted = [];
        List data = jsonDecode(response.body);

        data.forEach((postedItem) {
          posted.add(Posted.fromJson(postedItem));
        });

        return posted;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
