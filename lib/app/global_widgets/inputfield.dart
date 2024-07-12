import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

Widget containerInput(String image, title, Widget field) {
  return Container(
      child: Column(
    children: [
      Row(
        children: <Widget>[
          Image.asset(
            image,
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: buttonText().merge(TextStyle(color: Colors.black)),
          )
        ],
      ),
      field
    ],
  ));
}

Widget dividerWidget() {
  return Divider(
    height: 40,
    color: divider,
  );
}

Widget dividerTopWidget(double thickness) {
  return Divider(
    color: divider,
    thickness: thickness,
  );
}
