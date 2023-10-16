import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/todolist/edit_note_screen.dart';
import '../component/firestore.dart';
import '../component/note_model.dart';

class ToDoList extends StatefulWidget {
  Note note;
  ToDoList(this.note, {super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            imageWidget(),
            const SizedBox(
              width: 20,
            ),
            TextWidget()
          ]),
        ),
      ),
    );
  }

  Column TextWidget() {
    bool isDone = widget.note.isDone;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.note.title,
            ),
            Checkbox(
                activeColor: Color.fromARGB(255, 195, 88, 80),
                value: isDone,
                onChanged: (value) {
                  setState(() {
                    isDone = !isDone;
                    Firestore_Datasource().isdone(widget.note.id, isDone);
                  });
                })
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(widget.note.subtitle),
        const SizedBox(height: 20),
        btnwidget()
      ],
    );
  }

  Row btnwidget() {
    return Row(
      children: [
        Container(
          width: 70,
          height: 28,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 71, 71, 71),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.timelapse,
                color: Colors.white,
                size: 18,
              ),
              Text(
                widget.note.time,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditNoteScreen(widget.note)));
          },
          child: Container(
            width: 70,
            height: 28,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 179, 109, 109),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 18,
                ),
                Text(
                  'edit',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container imageWidget() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/image/${widget.note.image}.png'),
              fit: BoxFit.cover)),
    );
  }
}
