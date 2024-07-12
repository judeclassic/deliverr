import 'dart:convert';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/models/simple/errormodel.dart';
import 'package:donitaa_client/app/views/auth/login.dart';
import 'package:donitaa_client/app/views/auth/welcome.dart';
import 'package:donitaa_client/app/views/home/home.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import './../../models/usermodel.dart' as userModel;
import './../../repositories/user_repo.dart' as userRepo;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> registerformkey = GlobalKey<FormState>();
  userModel.User user = userModel.User();

  bool obs = true;
  static final validCharacters = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Welcome()),
            (route) => false),
        text: S.of(context).register,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              SizedBox(height: 75, child: Image.asset(logoAndText, color: red)),
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
                  key: registerformkey,
                  child: Column(
                    children: <Widget>[
                      containerInput(
                        emailIcon,
                        S.of(context).email,
                        TextFormField(
                          validator: (value) {
                            if (value!.length < 3) {
                              return 'Enter a valid name';
                            }
                            return null;
                          },
                          onSaved: (input) => user.name = input,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Jonn Doe',
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
                        phoneIcon,
                        S.of(context).phone_number,
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (!value!.startsWith("+")) {
                              return S.of(context).must_be_a_valid_phone_number;
                            }
                            return null;
                          },
                          onSaved: (input) => user.phone = input,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '+13548058493',
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
                            } else if (!value.contains(validCharacters)) {
                              return S.of(context).password_description;
                            }
                            return null;
                          },
                          onSaved: (input) => user.password = input,
                          maxLength: 14,
                          cursorColor: Colors.black,
                          obscureText: obs,
                          decoration: InputDecoration(
                            hintText: '*********',
                            helperText: S.of(context).password_description,
                            helperStyle: TextStyle(color: black, fontSize: 7),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: authButton(context, () {
                  if (registerformkey.currentState!.validate()) {
                    Loader.show(context,
                        isAppbarOverlay: true,
                        isBottomBarOverlay: true,
                        progressIndicator: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        themeData: Theme.of(context),
                        overlayColor: Color(0x99E8EAF6));

                    registerformkey.currentState!.save();
                    userRepo.register(user).then((value) {
                      // Err err = Err.fromJSON(json.decode(value.body));
                      if (value.statusCode == 200 || value.statusCode == 201) {
                        print(json.decode(value.body)['message']);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(json.decode(value.body)['message']),
                          duration: Duration(seconds: 5),
                        ));

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value.body.split('[')[1].split('"')[1]),
                          duration: Duration(seconds: 5),
                        ));
                      }
                      Loader.hide();
                    }).catchError((err) {
                      Loader.hide();
                    }).onError((error, stackTrace) {
                      Loader.hide();
                    });
                  }
                }, text: S.of(context).register, backGroundColor: red),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    S.of(context).already_have_accountr,
                    textAlign: TextAlign.end,
                    style: buttonText()
                        .merge(TextStyle(color: Colors.black54, fontSize: 13)),
                  ),
                  SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false),
                    child: Text(
                      S.of(context).login,
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
