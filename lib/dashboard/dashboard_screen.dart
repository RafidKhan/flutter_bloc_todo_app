import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/todo/view/todo_list_screen.dart';
import 'package:flutter_bloc_todo/users/view/user_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TodoListScreen(),
                    ),
                  );
                },
                child: const Text("ToDo")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserListScreen(),
                    ),
                  );
                },
                child: const Text("Users")),
          ],
        ),
      ),
    );
  }
}
