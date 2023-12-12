import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCanceled;
  
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSaved,
    required this.onCanceled,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[400],
      content:Container(
        height: 120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
               TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a new task",
                  ),
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                  MyButton(text:"Save", onPressed: onSaved,),
                  const SizedBox(width: 10,),
                  MyButton(text:"Cancel", onPressed:onCanceled),

                ],
              ),
          ]),
        ),
    );
  }
}