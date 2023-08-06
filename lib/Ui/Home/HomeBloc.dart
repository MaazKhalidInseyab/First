import 'package:bloc/DataProvider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc{
   final user = BehaviorSubject<String>();
  // var something="asd";
  // void dosomething()async{
  //
  // }
getTopics(){
  DataProvider().getTopics();

}
}