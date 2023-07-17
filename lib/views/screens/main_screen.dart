import 'package:flutter/material.dart';

import '../../models/todos_model.dart';
import '../../services/todos_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Temperatures> todos = [];
  @override
  void initState() {
    super.initState();
    getTodos();
  }

  getTodos()async
  {
    todos = await TodosService().getTodosData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context , index) {
          return ListTile(
            title: Text(todos[index].title??"--"),
          trailing: TextButton(

            onPressed: () {  },
          child: Text(
              todos[index].completed.toString()),),
          );
        },
      itemCount: todos.length,
    );
  }
}
