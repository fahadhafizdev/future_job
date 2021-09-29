import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  Future<UserModel> register(
      String email, String password, String name, String goal) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal,
      };

      var response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/register'),
        body: body,
      );

      print('cek Status Code Register :${response.statusCode}');
      print(response.body);

      //NOTE: KEMBANGKAN STATUS BODY MESSAGE ERROR
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/login'),
        body: body,
      );

      print('cek Status Code Login :${response.statusCode}');
      print(response.body);

      //NOTE: KEMBANGKAN STATUS BODY MESSAGE ERROR
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
