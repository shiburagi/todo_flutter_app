import 'package:business_logic/bloc/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/models/todo.dart';
import 'package:todo_flutter_app/models/filter.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key, this.filter, this.padding}) : super(key: key);

  final Filter filter;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, List<Todo>>(builder: (context, snapshot) {
      List<Todo> todos = snapshot
          .where((todo) =>
              filter.isCompleted == null || filter.isCompleted == todo.status)
          .toList();
      return todos.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "No result found...",
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              padding: padding,
              itemBuilder: (context, index) {
                Todo todo = todos[index];
                return TodoItem(todo: todo);
              },
              itemCount: todos.length,
            );
    });
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            InkWell(
              onTap: () => context.read<TodoBloc>().toggleStatus(todo),
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 0, 16),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).dividerColor)),
                child: Opacity(
                  child: Icon(Icons.done, color: Colors.green),
                  opacity: todo.status == true ? 1 : 0,
                ),
              ),
            ),
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(16, 8, 0, 8),
                    child: Text(todo.todo))),
            FloatingActionButton(
              mini: true,
              child: Icon(Icons.delete_outline),
              onPressed: () => context.read<TodoBloc>().deleteTodo(todo),
            )
          ],
        ),
      ),
    );
  }
}
