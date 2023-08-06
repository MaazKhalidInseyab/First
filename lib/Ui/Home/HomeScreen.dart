import 'package:bloc/Ui/Home/HomeBloc.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({super.key});
HomeBloc homeBloc=HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Center(
            child: SafeArea(
              child: Text("Topicss"),
            ),
          ),

        ],
      ),floatingActionButton: FloatingActionButton(onPressed:homeBloc.getTopics ),
    );
  }
}
