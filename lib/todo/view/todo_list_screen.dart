import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/todo/cubit/todo_list_cubit.dart';
import 'package:flutter_bloc_todo/todo/view/todo_add_bottomsheet.dart';
import 'package:flutter_bloc_todo/todo/view/todo_detail_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => TodoListCubit()..fetchTodoItems(),
        child: const DataView(),
      ),
    );
  }
}

class DataView extends StatelessWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TodoListCubit>();
    final state = cubit.state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        return const TodoList();
      case ListStatus.loading:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TodoListCubit>();
    final state = cubit.state;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.clearTitleController();
          cubit.clearDescriptionController();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => TodoAddBottomSheet(
              cubit: cubit,
              onSave: (title, description) {
                Navigator.pop(context);
                cubit.addTodo(title: title, description: description);
              },
            ),
          );
          //cubit.addTodo();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: state.todoItems.length,
        itemBuilder: (context, index) {
          final element = state.todoItems[index];
          return ListTile(
            title: Text(element.title),
            leading: const Icon(Icons.note),
            trailing: IconButton(
              onPressed: () {
                cubit.deleteTodo(model: element);
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailScreen(
                    model: element,
                    onSave: (id, title, description) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      cubit.updateTodoItem(
                        id,
                        title,
                        description,
                      );
                    },
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
