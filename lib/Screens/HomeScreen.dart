import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import '../Cubit/task_cubit.dart';
import 'package:final_project/database/database.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});




  @override
  Widget build(BuildContext context) {
 var cubit=TaskCubit.get(context);

    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('To Do'),
            centerTitle: true,

            actions: [


              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _showAddTaskDialog(context);
                },
              ),
            ],
          ),body: state is Dataloading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            :  Center(
            child: Text('This is the home page'),
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tasksPage');
                    },
                    child: Text('Tasks'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/thirdPage');
                    },
                    child: Text('Done'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/archivedPage');
                    },
                    child: Text('Archived'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
void _showAddTaskDialog(BuildContext context) {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Enter Your Title'),
            ),
            TextField(
             controller: dateController,
              decoration: InputDecoration(hintText: 'Enter Your Date'),
            ),
            TextField(
             controller: timeController,
              decoration: InputDecoration(hintText: 'Enter Your Time'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'Enter Your Description'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Add'),
              onPressed: () {
              var cubit=TaskCubit.get(context);
              cubit.insert_new_task(title: titleController.text, des: descriptionController.text, date: dateController.text, time: timeController.text);
      Navigator.of(context).pop();
              },
          ),
        ],
      );
    },
  );
}

