import 'package:flutter_bloc_todo/api_client/api_client.dart';
import 'package:flutter_bloc_todo/users/model/user_model.dart';

class UserRepository {
  final ApiClient apiClient = ApiClient();

  Future<List<UserModel>?> getUsersList() async {
    try {
      const String url = 'https://jsonplaceholder.typicode.com/users';

      final response = await apiClient.getRequest(url: url);

      if (response.statusCode == 200) {
        final List users = response.data;
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
