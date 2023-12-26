import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_cubit.dart';
import 'package:notes_app_wslc_194_cubit/Database/dbhelper.dart';
import 'package:notes_app_wslc_194_cubit/Screens/notesapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>NotesCubit(dbHelper: DbHelper.instance),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const NotesApp()
      ),
    );
  }
}