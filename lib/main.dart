import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.orange
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List.filled(0, "", growable: true);
  String input = "";

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My ToDos..."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  title: Text("Add toDo List"),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: [
                    FlatButton(
                        onPressed: (){
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                            "Add"
                        )
                    )
                  ],
                );
              }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
              key: Key(todos[index]),
              child: Card(
                elevation: 100,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                ),
              ));
        },
      ),
    );
  }
}

