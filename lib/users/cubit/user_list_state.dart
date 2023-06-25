part of 'user_list_cubit.dart';

enum UserListStatus { loading, success, failure }

class UserListState extends Equatable {
  const UserListState._({
    this.status = UserListStatus.loading,
    this.users = const <UserModel>[],
  });

  const UserListState.loading() : this._();

  const UserListState.success(List<UserModel> items)
      : this._(status: UserListStatus.success, users: items);

  const UserListState.failure() : this._(status: UserListStatus.failure);

  final UserListStatus status;
  final List<UserModel> users;

  @override
  List<Object> get props => [status, users];
}