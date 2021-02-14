import 'package:business_logic/bloc/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_app/models/filter.dart';
import 'package:todo_flutter_app/views/add_todo.dart';
import 'package:todo_flutter_app/views/header.dart';
import 'package:todo_flutter_app/views/todo_list.dart';
import 'package:todo_flutter_app/views/todo_status.dart';

class HomeScreen extends StatelessWidget {
  final List<Filter> filters = [
    Filter("All", null),
    Filter("Active", false),
    Filter("Completed", true),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
      child: DefaultTabController(
        initialIndex: 0,
        length: filters.length,
        child: Scaffold(
          appBar: HomeHeader(filters: filters),
          body: Stack(
            children: [
              TabBarView(
                children: filters
                    .map((filter) => TodoList(
                          filter: filter,
                          padding: const EdgeInsets.only(bottom: 96),
                        ))
                    .toList(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 4,
                child: TodoStatusView(),
              )
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddTodoView(),
            ],
          ),
        ),
      ),
    );
  }
}
