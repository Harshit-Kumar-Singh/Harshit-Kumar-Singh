import 'package:First_App/Scree1.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo List', home:  TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() =>  TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
              title:  Text('Mark "${_todoItems[index]}" as done?'),
              actions: <Widget>[
                 FlatButton(
                    child:  Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                 FlatButton(
                    child:  Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
  Widget _buildTodoList() {
    return  ListView.builder(
      itemBuilder: (context, index) {

        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }


  Widget _buildTodoItem(String todoText, int index) {
    return  ListTile(
        title:  Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(title:  Text('Subscribed Currencies'),backgroundColor: Colors.lightGreenAccent[400],),
      body: _buildTodoList(),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent[400],
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardFinal()));
          },
          tooltip: 'Add task',
          child:  Icon(Icons.add)),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push( MaterialPageRoute(builder: (context) {
      return  Scaffold(
          appBar:  AppBar(title:  Text('Add a  task')),
          body: TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context);
            },
          ));
    }));
  }
}
