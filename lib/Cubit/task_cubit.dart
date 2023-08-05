import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/database/database.dart';
import 'package:final_project/database/Task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  static TaskCubit get(context) => BlocProvider.of(context);
  List<Task> myTasks =[];

  Future<void> getdata()async{
    emit(Dataloading());
    myTasks=[];

    MyDatabase.getAllData().then((value){
      value.forEach((element) {
        Task task = Task.fromMap(element);
        myTasks.add(task);

      });
      emit(DataSuccess());
    }).catchError((error){
      print(error.toString());
      emit(DataFailure());
    });


  }
  void changeFinish({
    required bool value,
    required int index,
}){
    myTasks[index].type ="finish";
    MyDatabase.updateDatabase(
        title: myTasks[index].title!,
        des: myTasks[index].des!,
        date: myTasks[index].date!,
        time: myTasks[index].time!,
        id: myTasks[index].id!,
        type: myTasks[index].type!);
    emit(ChangeFinish());
  }
void insert_new_task({
    required title,
  required des,
  required date,
  required time,})async{
    await MyDatabase.insertToDatabase(title: title,
        des: des,
        date: date,
        time: time,
    type: 'New').then((value){
      getdata();
    }

    );
    emit(DataSuccess());
}

}



