import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_cubit.dart';

class Update extends StatefulWidget {
  var title;
  var desc;
  var id;
  Update(
      {super.key, required this.id, required this.title, required this.desc});
  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.text = widget.title;
    descController.text = widget.desc;

    return Scaffold(
      appBar: AppBar(
        title: Text("update taks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: descController,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Desc",
                  // hintStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<NotesCubit>(context)
              .updateData(widget.id, titleController.text, descController.text);

          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
