import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/add_to_do_page.dart';
import 'package:to_do_list/cubit/todo_cubit.dart';
import 'package:to_do_list/to_do_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

        initialRoute: '/',
        routes: {
          '/': (_) => const ToDoList(),
          '/add-todo': (_) => const AddToDoPage(),
        },
        home: const Scaffold(),
      ),
    );
  }
}
