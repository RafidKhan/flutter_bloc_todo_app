import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/users/cubit/user_detail_cubit.dart';
import 'package:flutter_bloc_todo/users/model/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel model;

  const UserDetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = UserDetailCubit();
    cubit.setUserData(model);
    return Scaffold(
      appBar: AppBar(
        title: Text(cubit.state?.name ?? ""),
        centerTitle: true,
      ),
      body: cubit.state == null
          ? const SizedBox()
          : Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.state?.username ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.email ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.address?.street ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.address?.city ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.address?.zipcode ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.address?.geo?.lat ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.address?.geo?.lng ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.phone ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.website ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.company?.name ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.company?.catchPhrase ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      cubit.state?.company?.bs ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
