import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/users/model/user_model.dart';
import 'package:flutter_bloc_todo/users/repository/user_repository.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(const UserListState.loading());

  final UserRepository repository = UserRepository();

  Future<void> getUserList() async {
    try {
      final response = await repository.getUsersList();

      if (response != null) {
        emit(UserListState.success(response));
      }
    } catch (e) {
      emit(const UserListState.failure());
    }
  }
}
