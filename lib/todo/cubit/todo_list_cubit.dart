import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/todo/models/todo_items_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<ComplexListState> {
  TodoListCubit() : super(const ComplexListState.loading());

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  clearTitleController() {
    titleController.clear();
  }

  clearDescriptionController() {
    descriptionController.clear();
  }

  Future<void> fetchTodoItems() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<TodoItemModel> todoItems = [
      for (int i = 0; i < 10; i++)
        TodoItemModel(
          id: i,
          title: 'Title $i',
          description: "Description $i",
        ),
    ];
    emit(ComplexListState.success(todoItems));
  }

  updateTodoItem(int id, String title, String description) {
    final updatedState = state.todoItems.map((item) {
      return item.id == id
          ? item.copyWith(title: title, description: description)
          : item;
    }).toList();

    emit(ComplexListState.success(updatedState));
  }

  deleteTodo({required TodoItemModel model}) {
    final deleteSuccess = List.of(state.todoItems)
      ..removeWhere((element) => element.id == model.id);
    emit(ComplexListState.success(deleteSuccess));
  }

  addTodo({
    required String title,
    required String description,
  }) {
    final int id = state.todoItems.length;
    final TodoItemModel item = TodoItemModel(
      id: id,
      title: title,
      description: description,
    );

    final addItemSuccess = List.of(state.todoItems)..add((item));
    emit(ComplexListState.success(addItemSuccess));
  }
}
