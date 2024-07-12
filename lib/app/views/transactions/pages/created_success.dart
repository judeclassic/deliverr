import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/views/home/home.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreationSuccess extends StatefulWidget {
  CreationSuccess({Key? key}) : super(key: key);

  @override
  _CreationSuccessState createState() => _CreationSuccessState();
}

class _CreationSuccessState extends State<CreationSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150),
            SvgPicture.asset(approvedSvg),
            SizedBox(height: 20),
            Text(
              'Shipment succesfully created.',
              style: title4(19, black),
            ),
            SizedBox(height: 8),
            Text(
              'Now sit back and relax, our Hero will pickup your package. Thank you!',
              textAlign: TextAlign.center,
              style: title4(14, black.withOpacity(.6)),
            ),
            SizedBox(height: 300),
            authButton(
                context,
                () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      ModalRoute.withName('/confirmtopup'),
                    ),
                text: 'See Shipment Status',
                backGroundColor: red)
          ],
        ),
      ),
    );
  }
}
