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

  void deleteNotes(NotesModel index,List<NotesModel>?arrnotes)async{
    emit(LoadingState());
    if(index.id==-1){
      dbHelper.deleteNotes(index as int);
      emit(LoadedState());
    }
    else{
      emit(ErrorState(errormsg: "An Error Occured"));
    }
  }
}
