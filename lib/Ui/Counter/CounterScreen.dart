
import 'package:bloc/Ui/Counter/CounterBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  late CounterBloc bloc;

  @override
  void initState() {
    bloc = CounterBloc();
      bloc.counter.sink.add(0);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              StreamBuilder(
                stream: bloc.counter.stream,
                builder: (BuildContext context, AsyncSnapshot<int> counterValue) {
                  return Text(
                    counterValue.hasData ? counterValue.data.toString() : '0',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton( heroTag: "btn1", onPressed: ()=> bloc.plus(),child: Icon(Icons.add),),FloatingActionButton(heroTag:"btn2",onPressed: ()=> bloc.minus(),child: Icon(CupertinoIcons.minus),),
        ],
      ),
    );
  }
}
