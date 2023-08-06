

import 'package:bloc/DataProvider.dart';
import 'package:bloc/Ui/LoginScreen/LoginBloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DataProvider dp=DataProvider();
  late LoginBloc bloc;


  @override
  void initState() {
    bloc = LoginBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.formKey,
      child: Scaffold(
        backgroundColor: Colors.blueAccent.shade400,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 17.0, left: 8.5, right: 8.5, bottom: 8.5),
                child: Card(
                  elevation: 6,shadowColor: Colors.black87,
                    color: Colors.white54,
                    shape:BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0),)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30),
                          TextFormField(

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter username';
                              }
                              //return null;
                            },

                            controller: bloc.userEmailCtrl,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "Username",labelStyle: TextStyle(color: Colors.white)
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              //return null;
                            },
                            controller: bloc.passwordCtrl,
                            decoration: InputDecoration(

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: "Password",labelStyle: TextStyle(color: Colors.white)
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              onPressed: ()=> bloc.LoginButton(),
                              child: Text("LOGIN")),

                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
