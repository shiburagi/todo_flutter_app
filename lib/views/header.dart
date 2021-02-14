import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_flutter_app/models/filter.dart';

class HomeHeader extends PreferredSize {
  const HomeHeader({
    Key key,
    @required this.filters,
    Widget child,
  }) : super(
            key: key,
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: child);

  final List<Filter> filters;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        margin: EdgeInsets.only(bottom: 2),
        child: SafeArea(
          child: TabBar(
            labelColor: Theme.of(context).textTheme.subtitle1.color,
            tabs: filters
                .map((filter) => Tab(
                      child: Text("${filter.label}"),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
