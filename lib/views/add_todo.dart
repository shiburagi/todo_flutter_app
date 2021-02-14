import 'package:business_logic/bloc/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({
    Key key,
  }) : super(key: key);

  @override
  _AddTodoViewState createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = context.read();
    return BottomAppBar(
      child: Container(
        height: kToolbarHeight,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 4, 0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: "Add Item"),
                ),
              ),
              flex: 1,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  bloc.addTodo(controller.text);
                  controller.clear();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
