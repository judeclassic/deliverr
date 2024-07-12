import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget authButton(BuildContext context, Function onTap,
    {Color? backGroundColor, String? text}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      alignment: Alignment.center,
      height: 45,
      decoration: BoxDecoration(
        color: backGroundColor != null ? backGroundColor : Colors.transparent,
        border: Border.all(
          color: red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text ?? '',
        textAlign: TextAlign.center,
        style: buttonText().merge(
          TextStyle(color: backGroundColor != null ? Colors.white : red),
        ),
      ),
    ),
  );
}
