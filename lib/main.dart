import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/components/new_todo.dart';
import 'package:my_app/components/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TodoController(),
    );
  }
}

class TodoController extends StatefulWidget {
  const TodoController({super.key});

  @override
  State<TodoController> createState() => _TodoControllerState();
}

class _TodoControllerState extends State<TodoController> {
  bool showNewTodoForm = false;
  List<Todo> todos = [];
  void toggleNewTodoForm() {
    setState(() {
      showNewTodoForm = !showNewTodoForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: showNewTodoForm
            ? NewTodo(
                onAddTodo: (title, description) {
                  setState(() {
                    todos.add(Todo(
                      title: title,
                      description: description,
                    ));
                  });
                  toggleNewTodoForm();
                },
              )
            : TodoList(
                todos: todos,
                onTodoDelete: (index) {
                  setState(() {
                    todos.removeAt(index);
                  });
                },
                onTodoDone: (index) {
                  setState(() {
                    todos[index].isDone = true;
                  });
                },
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          shape: const CircleBorder(),
          onPressed: toggleNewTodoForm,
          child: Icon(
            showNewTodoForm ? Icons.close : Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
