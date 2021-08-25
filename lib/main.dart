import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/provider/todo_provider.dart';
import 'package:todo_app/screens/foundation_screen.dart';

import 'utils/behavior.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Todo App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: child!,
                );
              },
              home: const FoundationScreen(),
            ));
  }
}
