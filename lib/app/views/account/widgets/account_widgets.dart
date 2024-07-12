import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget accountListItem(String icon, text, Function ontap) {
  return InkWell(
    onTap: () {
      print('One');
      ontap();
    },
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Image.asset(
            icon,
            scale: .7,
          ),
        ),
        SizedBox(width: 17),
        Text(
          text,
          style: TextStyle(
            color: black,
            fontSize: 15,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: red,
        ),
      ],
    ),
  );
}
