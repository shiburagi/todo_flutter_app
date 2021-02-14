import 'package:flutter/material.dart';
import 'package:todo_flutter_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: createTheme(),
      darkTheme: createTheme(brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}

ThemeData createTheme({Brightness brightness}) {
  return ThemeData(
    brightness: brightness,
    primarySwatch: Colors.blue,
    accentColor: Colors.deepOrangeAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
