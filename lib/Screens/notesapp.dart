import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_cubit.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_state.dart';
import 'package:notes_app_wslc_194_cubit/Screens/adddata.dart';
import 'package:notes_app_wslc_194_cubit/Screens/update.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});
  @override
  State<NotesApp> createState() => _AddDataState();
}

class _AddDataState extends State<NotesApp> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
        centerTitle: true,
      ),
      body: BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorState) {
          return Center(child: Text('Error : ${state.errormsg}'));
        } else if (state is LoadedState) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Update(
                                  id: state.arrnotes![index].id,
                                  title: state.arrnotes![index].title,
                                  desc: state.arrnotes![index].desc,
                                )));
                  },
                  child: ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(state.arrnotes![index].title),
                    subtitle: Text(state.arrnotes![index].desc),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<NotesCubit>()
                              .deleteNotes(state.arrnotes![index].id!);
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                );
              },
              itemCount: state.arrnotes!.length);
        }
        return Container();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddData()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
