
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
class Connection{

 Future<bool> isNotConnected()async{
   final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile||connectivityResult==ConnectivityResult.wifi||connectivityResult==ConnectivityResult.ethernet){
      return false;
    }
    return true;
  }

}