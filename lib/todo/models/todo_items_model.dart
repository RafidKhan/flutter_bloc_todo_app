import 'package:equatable/equatable.dart';

class TodoItemModel extends Equatable {
  const TodoItemModel({
    required this.id,
    required this.title,
    required this.description,
  });

  final int id;
  final String title;
  final String description;

  TodoItemModel copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return TodoItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        description,
      ];
}
