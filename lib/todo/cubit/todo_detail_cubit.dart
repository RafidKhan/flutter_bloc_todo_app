import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/todo/cubit/todo_list_cubit.dart';
import 'package:flutter_bloc_todo/todo/models/todo_items_model.dart';

class TodoDetailCubit extends Cubit<TodoItemModel> {
  TodoDetailCubit({required TodoItemModel model}) : super(model);

  final TodoListCubit todoListCubit = TodoListCubit();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  setTitle() {
    titleController.text = state.title;
  }

  setDescription() {
    descriptionController.text = state.description;
  }
}
