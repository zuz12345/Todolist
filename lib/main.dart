import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/task_cubit.dart';
import 'Screens/HomeScreen.dart';
import 'package:final_project/database/database.dart';

import 'Screens/archievedpage.dart';
import 'Screens/taskpage.dart';
import 'Screens/DonePage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyDatabase.initializeDatabase();




  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TaskCubit()..getdata(),
    child: MaterialApp(  initialRoute: '/',
      routes: {
        '/thirdPage': (context) => ThirdPage(),
        '/archivedPage': (context) => ArchivedPage(),
        '/tasksPage': (context) => TasksPage(),
      },
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    )
    );
  }
}
