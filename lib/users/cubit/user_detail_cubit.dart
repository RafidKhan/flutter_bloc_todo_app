import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/users/model/user_model.dart';

class UserDetailCubit extends Cubit<UserModel?> {
  UserDetailCubit() : super(null);

  setUserData(UserModel model) {
    emit(model);
  }
}
