import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final TabController controller;

  const CustomBottomBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backGroudColor,
      elevation: 0,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(.3),
                blurRadius: 10,
                offset: Offset(2, 2),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                homeIcon,
                fit: BoxFit.fitWidth,
              ),
              onPressed: () {
                controller.animateTo(0);
              },
            ),
            IconButton(
              icon: Image.asset(transactionIcon),
              onPressed: () {
                controller.animateTo(1);
              },
            ),
            IconButton(
              icon: Image.asset(inboxIcon),
              onPressed: () {
                controller.animateTo(2);
              },
            ),
            IconButton(
              icon: Image.asset(accountIcon),
              onPressed: () {
                controller.animateTo(3);
              },
            )
          ],
        ),
      ),
    );
  }
}
