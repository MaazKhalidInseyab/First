import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class CounterBloc {

final counter = BehaviorSubject<int>();


void plus(){
  var value = counter.stream.value;

  counter.sink.add(++value);
}
void minus(){
  var value = counter.stream.value;
  value--;
  counter.sink.add(value);

}


}