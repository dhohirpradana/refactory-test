import 'package:flutter/material.dart';
import 'package:todo_app/widgets/home/header_widget.dart';
import 'package:todo_app/widgets/home/body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HeaderWidget(),
          BodyWidget(),
        ],
      ),
    );
  }
}
