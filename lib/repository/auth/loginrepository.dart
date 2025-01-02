import 'package:clean_architecture_and_blog/config/app_url.dart';
import 'package:clean_architecture_and_blog/config/data/exception/network/networkservices.dart';
import 'package:clean_architecture_and_blog/models/user/user_model.dart';
import 'package:flutter/material.dart';

class Loginrepository {
  final _api = Networkservices();

  Future<UserModel> LoginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.LoginApi, data);
    print(response);
    return UserModel.fromJson(response);
  }
}
