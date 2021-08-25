import 'package:flutter/material.dart';
import 'package:todo_app/helpers/google.dart';
import 'package:todo_app/utils/app_color.dart';
import 'package:todo_app/widgets/signin_button_widget.dart';

class FoundationScreen extends StatefulWidget {
  const FoundationScreen({Key? key}) : super(key: key);

  @override
  _FoundationScreenState createState() => _FoundationScreenState();
}

class _FoundationScreenState extends State<FoundationScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Authentication.initializeFirebase(context: context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.propheticSea,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      GoogleSignInButton(),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
