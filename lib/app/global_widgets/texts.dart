import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Widget title(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget tinyTitle(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget largeText(String text, Color color) {
  return Text(
    text,
    maxLines: 3,
    overflow: TextOverflow.fade,
    softWrap: false,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      // overflow: TextOverflow.ellipsis
    ),
  );
}

Widget moneyText(String text, Color color, double fontsize) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget seeAllRow(String text, Function seeAllFun, BuildContext ctx) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      title(text, black),
      GestureDetector(
        onTap: () => seeAllFun,
        child: Text(
          S.of(ctx).see_all,
          style: captionText1().merge(TextStyle(color: red)),
        ),
      )
    ],
  );
}
