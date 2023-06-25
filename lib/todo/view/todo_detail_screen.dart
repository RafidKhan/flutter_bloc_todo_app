import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/todo/cubit/todo_detail_cubit.dart';
import 'package:flutter_bloc_todo/todo/models/todo_items_model.dart';
import 'package:flutter_bloc_todo/todo/view/todo_edit_bottomsheet.dart';

class TodoDetailScreen extends StatelessWidget {
  final TodoItemModel model;
  final Function(int id, String title, String description) onSave;

  const TodoDetailScreen({Key? key, required this.model, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = TodoDetailCubit(model: model);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              cubit.setTitle();
              cubit.setDescription();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => TodoEditBottomSheet(
                  cubit: cubit,
                  onSave: (title, description) {
                    onSave(
                      model.id,
                      title,
                      description,
                    );
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.state.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cubit.state.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
