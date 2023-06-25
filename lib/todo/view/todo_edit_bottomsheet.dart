import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/todo/cubit/todo_detail_cubit.dart';

class TodoEditBottomSheet extends StatelessWidget {
  final TodoDetailCubit cubit;
  final Function(String title, String description) onSave;

  const TodoEditBottomSheet(
      {Key? key, required this.cubit, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: cubit.titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: cubit.descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  onSave(
                    cubit.titleController.text,
                    cubit.descriptionController.text,
                  );
                },
                child: const Text("Save"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
