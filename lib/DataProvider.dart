import 'dart:async';

import 'package:bloc/Connection.dart';
import 'package:bloc/ProgressDialogListener.dart';

import 'package:bloc/Ui/Counter/CounterScreen.dart';
import 'package:bloc/Ui/Home/HomeScreen.dart';
import 'package:bloc/Ui/LoginScreen/LoginBloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Code.dart';
import 'Factory.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'Models/TopicsResponse.dart';
import 'Models/loginResponse.dart';

class DataProvider {

  final user = BehaviorSubject<String>();
  var dio = Dio();

  void login(
      BuildContext context, String email, String password, formKey,ProgressDialogListener progressDialogListener) async {
    if (await Connection().isNotConnected()) {
      Factory().showSnackbar(context, 'NO CONNECTION');
      return;
    }
    progressDialogListener.show();
    if (formKey.currentState!.validate()) {
      var formData =
          FormData.fromMap({'Email': email, 'PasswordHash': password});
      try {
        final response =
            await dio.post("https://haji.ai:2053/login", data: formData);
        print("status code:"+response.statusCode.toString());
        if (response.statusCode == 200) {
          LoginResponse res = LoginResponse.fromJson(response.data);

          if (res.code == 200) {
            final SharedPreferences storage = await SharedPreferences.getInstance();
            await storage.setString(Code.LOGIN_RESPONSE.name, response.data.toString());

             progressDialogListener.hide();
          } else if (res.code == 401) {
progressDialogListener.dismiss(res.res);


          } else {
            Factory().showSnackbar(context, 'Something Went wrong');
            progressDialogListener.dismiss(res.res);

          }
        }
      } catch (e) {
        print(e);
        progressDialogListener.dismiss(e.toString());

      }
    }
    debugPrint(email + " " + password + " Logged In ");
  }
  getTopics()async{
    final response =await dio.post("https://haji.ai:2053/GetTopic",data:{'Gpt_User_Id': 185} );
    print('Topics : '+response.toString());
    if (response.statusCode == 200) {
      TopicsResponse res = TopicsResponse.fromJson(response.data);
      print(res.code);
      //

    }

  }
}
