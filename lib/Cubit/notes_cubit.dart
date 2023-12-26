import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_wslc_194_cubit/Cubit/notes_state.dart';
import 'package:notes_app_wslc_194_cubit/Database/dbhelper.dart';
import 'package:notes_app_wslc_194_cubit/Models/notesmodel.dart';

class NotesCubit extends Cubit<NotesState> {
  DbHelper dbHelper;
  NotesCubit({required this.dbHelper}) : super(InitialState());

  addNotes(NotesModel notesModel) async {
    emit(LoadingState());
    bool check = await dbHelper.insertData(notesModel);
    if (check) {
      var notes = await dbHelper.getData();
      emit(LoadedState(arrnotes: notes));
    } else {
      emit(ErrorState(errormsg: "Data Has Not Be Added in Database"));
    }
  }

  void getAllNotes() async {
    emit(LoadingState());
    var notes = await dbHelper.getData();
    emit(LoadedState(arrnotes: notes));
  }

  Future<void> updateData(int id, String title, String desc) async {
    bool check = await dbHelper
        .updateNotes(NotesModel(id: id, title: title, desc: desc));
    if (check) {
      emit(LoadedState(arrnotes: await dbHelper.getData()));
    } else {
      print("Data Not update");
    }
  }

  Future<void> deleteNotes(
    int index,
  ) async {
    emit(LoadingState());
    bool check = await dbHelper.deleteNotes(index);
    if (check) {
      emit(LoadedState(arrnotes: await dbHelper.getData()));
    } else {
      emit(ErrorState(errormsg: "An Error Occured"));
    }
  }
}
