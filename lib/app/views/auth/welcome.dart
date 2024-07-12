import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/views/auth/login.dart';
import 'package:donitaa_client/app/views/auth/register.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SizedBox(height: 10),
              Image.asset(
                logo,
                height: 80,
              ),
              SizedBox(height: 180),
              authButton(
                  context,
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register())),
                  backGroundColor: red,
                  text: S.of(context).register),
              SizedBox(height: 20),
              authButton(
                  context,
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  text: S.of(context).login),
            ],
          ),
        ),
      ),
    );
  }
}
