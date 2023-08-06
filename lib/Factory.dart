
import 'package:bloc/Ui/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Code.dart';

class Factory{
  void saveLoginResponse(String jsonData) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Code.LOGIN_RESPONSE.name, jsonData);
  }
  showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white,
      content: Center(child: Text(message,style: TextStyle(color: Colors.cyan.shade900))),
    ));
  }
  Future<void> showProgressDialog(BuildContext context) async {
    Constants.isShowing = true;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        final dialog = AlertDialog(
          content: SingleChildScrollView(
            child: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Please wait",
                    style: TextStyle(
                      color: Colors.cyan.shade900,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        return dialog;
      },
    );
  }

   dismissProgressDialog(BuildContext context) {Constants.isShowing = false;Navigator.of(context).pop();}

}