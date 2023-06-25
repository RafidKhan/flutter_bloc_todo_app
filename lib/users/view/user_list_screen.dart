import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/users/cubit/user_list_cubit.dart';
import 'package:flutter_bloc_todo/users/model/user_model.dart';
import 'package:flutter_bloc_todo/users/view/user_detail_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => UserListCubit()..getUserList(),
        child: const DataView(),
      ),
    );
  }
}

class DataView extends StatelessWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UserListCubit>();
    final state = cubit.state;
    switch (state.status) {
      case UserListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case UserListStatus.success:
        return const UserList();
      case UserListStatus.loading:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UserListCubit>();
    final state = cubit.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: ListView.builder(
        itemCount: state.users.length,
        itemBuilder: (context, index) {
          final UserModel user = state.users[index];
          return ListTile(
            title: Text(user.name ?? ""),
            leading: const Icon(Icons.person),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    model: user,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
