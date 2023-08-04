import 'dart:async';
import 'dart:convert';
import 'package:bloc/Code.dart';
import 'package:bloc/DataProvider.dart';
import 'package:bloc/ProgressDialogListener.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Factory.dart';

import '../../Models/loginResponse.dart';
import '../Constants.dart';
import '../Home/HomeScreen.dart';

class LoginBloc implements ProgressDialogListener{
  BuildContext context;

  LoginBloc(this.context);

  late LoginResponse res;
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void LoginButton()  {

  final String email=userEmailCtrl.text.toString();
  final String pass=passwordCtrl.text.toString();
  DataProvider().login(context,email,pass,formKey,this);

  }



  @override
  void hide() {
    if (Constants.isShowing) Factory().dismissProgressDialog(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
  }

  @override
  void show() {
if(!Constants.isShowing)Factory().showProgressDialog(context);

  }

  @override
  void dismiss(String? error) {
    if (Constants.isShowing) Factory().dismissProgressDialog(context);

    Factory().showSnackbar(context, error!);
  }

}
