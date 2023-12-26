import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_cubit.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_state.dart';
import 'package:notes_app_wslc_194_cubit/Models/notesmodel.dart';
import 'package:notes_app_wslc_194_cubit/Widgets/uihelper.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text("Add Data"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomTextField(titleController,"Enter Title", Icons.title),
              UiHelper.CustomTextField(descController, "Enter Description", Icons.description),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                var title=titleController.text.toString();
                var desc=descController.text.toString();
                if(title=="" && desc==""){
                  return log("Enter Required Field's");
                }
                else{
                  context.read<NotesCubit>().addNotes(NotesModel(title: title, desc: desc));
                  Navigator.pop(context);
                }
              }, child: Text("Save Data"))
            ],),
        );
      },
    );
  }
}
