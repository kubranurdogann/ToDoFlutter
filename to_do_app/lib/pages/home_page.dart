import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List toDoList = [
    ["Learn English",false],
    ["Do Exercise",false],
  ];
  

  void checkBoxChanged(bool? value,int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Create a new task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (contex){
        return DialogBox(
          controller: _controller,
          onCanceled: () => Navigator.of(contex).pop(),
          onSaved: saveNewTask,
        );
      }
    );
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
          title: const Text(
            "T O   D O   A P P",
            style: TextStyle(fontWeight: FontWeight.bold, color:  Color.fromARGB(255, 84, 9, 49),),
          ),
          elevation: 0,
          backgroundColor: Colors.pink[400],),
      floatingActionButton: Wrap(runSpacing: 10, spacing: 10, children: [ FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.pink[400],
        child: const Icon(Icons.add),
      )],),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1], 
              onChanged: (value)=> checkBoxChanged(value,index),
              deleteFunction: (context) => deleteTask(index),
              );
              
        })
    );
  }
}
