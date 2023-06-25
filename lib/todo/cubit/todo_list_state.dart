part of 'todo_list_cubit.dart';

enum ListStatus { loading, success, failure }

class ComplexListState extends Equatable {
  const ComplexListState._({
    this.status = ListStatus.loading,
    this.todoItems = const <TodoItemModel>[],
  });

  const ComplexListState.loading() : this._();

  const ComplexListState.success(List<TodoItemModel> items)
      : this._(status: ListStatus.success, todoItems: items);

  const ComplexListState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<TodoItemModel> todoItems;

  @override
  List<Object> get props => [status, todoItems];
}
