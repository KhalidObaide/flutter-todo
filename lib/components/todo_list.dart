import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  final Function(int) onTodoDelete;
  final Function(int) onTodoDone;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTodoDelete,
    required this.onTodoDone,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void onTodoDelete(int index) {
    setState(() {
      widget.onTodoDelete(index);
    });
  }

  void onTodoDone(int index) {
    setState(() {
      widget.onTodoDone(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: widget.todos.isNotEmpty
            ? ListView.builder(
                itemCount: widget.todos.length,
                itemBuilder: (context, index) {
                  final todo = widget.todos[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutQuint,
                    decoration: BoxDecoration(
                      color: todo.isDone
                          ? Colors.green.withOpacity(0.2)
                          : Colors.blueGrey[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(todo.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      subtitle: Text(todo.description,
                          style: const TextStyle(color: Colors.white70)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => onTodoDelete(index),
                            icon: const Icon(Icons.delete,
                                color: Colors.redAccent),
                          ),
                          if (!todo.isDone)
                            IconButton(
                              onPressed: () => onTodoDone(index),
                              icon: const Icon(Icons.check_circle,
                                  color: Colors.lightGreenAccent),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  'No todos yet!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
      ),
    );
  }
}
