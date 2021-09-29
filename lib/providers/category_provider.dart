import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_job/models/job.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<Job>> getCategories() async {
    try {
      var response = await http
          .get(Uri.parse('https://bwa-jobs.herokuapp.com/categories'));

      print('status code : ${response.statusCode}');
      print('body : ${response.body}');

      if (response.statusCode == 200) {
        List<Job> job = [];
        List data = jsonDecode(response.body);

        data.forEach((category) {
          job.add(Job.fromJson(category));
        });

        return job;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
