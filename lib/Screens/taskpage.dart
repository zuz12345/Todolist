import 'package:final_project/Cubit/task_cubit.dart';
import 'package:final_project/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'HomeScreen.dart';
class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = TaskCubit.get(context);
    return BlocConsumer<TaskCubit, TaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Tasks'),
              ),
              body: state is Dataloading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                itemBuilder: (BuildContext context, int index) {  children: [
                  Card(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 30),
                            child: Text(
                              cubit.myTasks[index].title,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 30),
                            child: Row(
                              children: [
                                Text(
                                  cubit.myTasks[index].date,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  cubit.myTasks[index].time,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async{
                                    MyDatabase.deleteRowFromDatabase(id: cubit.myTasks[index].id);
                                    cubit.getdata();
                                  },
                                  color: Colors.red,
                                ),
                                IconButton(
                                  icon: Icon(Icons.archive),
                                  onPressed: () {},
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ];
                },
                 itemCount: cubit.myTasks.length,
              )
          );
        }
    );
  }
}