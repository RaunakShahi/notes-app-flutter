// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool check;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.check,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.pink[200], borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: check,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //Task Name
              Text(taskName,
                  style: TextStyle(
                      decoration: check
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
