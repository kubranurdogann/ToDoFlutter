// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0,right:25,top:25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(color: Colors.pink[400],
          borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              //CheckBox
              Checkbox(value: taskCompleted, 
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 84, 9, 49),),
              //TaskName
               Text(taskName, 
               style: TextStyle(
               fontWeight: FontWeight.bold,
               color:const Color.fromARGB(255, 84, 9, 49),
               decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none),),
            ],
          ),
          
        ),
      ),
    );
  }
}
