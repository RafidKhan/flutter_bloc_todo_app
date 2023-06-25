import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/todo/view/todo_list_screen.dart';
import 'package:flutter_bloc_todo/users/view/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const TodoListScreen(),
      home: const UserListScreen(),
    );
  }
}
