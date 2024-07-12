import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeOperationBtn(String icon, text, Function ontap) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Column(
      children: <Widget>[
        Image.asset(icon),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(
            color: black,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    ),
  );
}
