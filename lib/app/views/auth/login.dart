import 'dart:convert';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/models/simple/errormodel.dart';
import 'package:donitaa_client/app/views/auth/register.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import './../../models/usermodel.dart' as userModel;
import './../../repositories/user_repo.dart' as userRepo;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();
  userModel.User user = userModel.User();

  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: closeIcon,
        onTap1: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              SizedBox(height: 80, child: Image.asset(logoAndText, color: red)),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 3),
                      blurRadius: 34,
                      spreadRadius: 13,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Form(
                  key: loginformkey,
                  child: Column(
                    children: <Widget>[
                      containerInput(
                        emailIcon,
                        S.of(context).email,
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!value!.trim().contains('@')) {
                              return S.of(context).must_be_a_valid_email;
                            }
                            return null;
                          },
                          onSaved: (input) => user.email = input,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'somebody@domain.com',
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 1.3),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      containerInput(
                        passwordIcon,
                        S.of(context).password,
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 6) {
                              return S.of(context).password_must_be_more;
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          obscureText: obs,
                          onSaved: (input) => user.password = input,
                          decoration: InputDecoration(
                            hintText: '*********',
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obs = !obs;
                                  });
                                },
                                child: Icon(
                                  obs ? Icons.visibility : Icons.visibility_off,
                                )),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 1.3),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black54, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot your password?',
                            textAlign: TextAlign.end,
                            style: buttonText().merge(
                                TextStyle(color: Colors.black54, fontSize: 12)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: authButton(context, () {
                  if (loginformkey.currentState!.validate()) {
                    loginformkey.currentState!.save();

                    Loader.show(context,
                        isAppbarOverlay: true,
                        isBottomBarOverlay: true,
                        progressIndicator: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        themeData: Theme.of(context),
                        overlayColor: Color(0x99E8EAF6));

                    userRepo.login(user).then((value) {
                      if (value.statusCode == 401) {
                        Err err = Err.fromJSON(json.decode(value.body));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(err.message ?? ''),
                            duration: Duration(milliseconds: 30000),
                          ),
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pages(initialIndex: 0)),
                            (route) => false);
                      }
                    });

                    Loader.hide();
                  }
                }, text: S.of(context).login, backGroundColor: red),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    S.of(context).have_no_account_yet,
                    textAlign: TextAlign.end,
                    style: buttonText()
                        .merge(TextStyle(color: Colors.black54, fontSize: 13)),
                  ),
                  SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                        (route) => false),
                    child: Text(
                      S.of(context).register,
                      textAlign: TextAlign.end,
                      style: buttonText()
                          .merge(TextStyle(color: red, fontSize: 13)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
