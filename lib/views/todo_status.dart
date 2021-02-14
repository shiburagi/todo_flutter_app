import 'package:business_logic/bloc/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/models/todo.dart';

class TodoStatusView extends StatelessWidget {
  const TodoStatusView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, List<Todo>>(
      builder: (context, state) {
        int activeCount = state.where((todo) => !todo.status).length;
        return Card(
          color: Theme.of(context).accentColor,
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "$activeCount ${activeCount > 1 ? "items" : "item"} left",
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                OutlineButton(
                  color: Colors.white,
                  borderSide: BorderSide(color: Colors.white54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  textColor: Colors.white,
                  child: Text("Clear completed"),
                  onPressed: () => context.read<TodoBloc>().clearCompleted(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
