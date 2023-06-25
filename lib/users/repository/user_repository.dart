import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_todo/users/model/user_model.dart';

class UserRepository {
  final Dio dio = Dio();

  Future<List<UserModel>?> getUsersList() async {
    try {
      const String url = 'https://jsonplaceholder.typicode.com/users';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        List users = response.data;
        final List<UserModel> userList = [];
        users.forEach((element) {
          userList.add(UserModel.fromMap(element));
        });
        return userList;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
