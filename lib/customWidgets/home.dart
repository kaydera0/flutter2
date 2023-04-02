import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String task;
  List<String> todoList = [];

  @override
  void initState() {
    todoList.add("value");
    todoList.add("value1");
    todoList.add("value2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text("My testing Flutter App"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]),
            child: Card(
              child: ListTile(
                title: Text(todoList[index], textAlign: TextAlign.center),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.indigo,
                ),
              ),
              elevation: 2.0,
              margin: EdgeInsets.all(10.0),
              color: Colors.blue[500],
              shadowColor: Colors.deepPurple,
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  todoList.removeAt(index);
                });
              }
            },
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text("add your task"),
              content: TextField(onChanged: (String s){
                task = s;
                },),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(task);

                  });
                  Navigator.of(context).pop();
                  ;
                }, child: Text("ADD"))
              ],
            );
          });
        },
        child: Icon(
          Icons.ad_units,
        ),
      ),
    );
  }
}
