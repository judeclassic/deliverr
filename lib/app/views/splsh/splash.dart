import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/auth/welcome.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString('user_email') != null
        ? getUserInfo()
        : print('No User');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                // ignore: unnecessary_null_comparison
                preferences.getString('user_email') != null
                    ? Pages(initialIndex: 0)
                    : Welcome()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Center(
              child: Image.asset(logo),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Versi 1.0.0',
                style: appBarTitle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
