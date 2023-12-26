import '../Models/notesmodel.dart';

abstract class NotesState{}
class InitialState extends NotesState{}
class LoadingState extends NotesState{}
class LoadedState extends NotesState{
  List<NotesModel>?arrnotes=[];
  int? id;
  LoadedState({this.arrnotes,this.id});
}
class ErrorState extends NotesState{
  String errormsg;
  ErrorState({required this.errormsg});
}
