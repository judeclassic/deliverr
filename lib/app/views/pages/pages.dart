import 'package:donitaa_client/app/views/account/account.dart';
import 'package:donitaa_client/app/views/home/home.dart';
import 'package:donitaa_client/app/views/location/location.dart';
import 'package:donitaa_client/app/views/transactions/shipment/shipment_page.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_navigation.dart';

class Pages extends StatefulWidget {
  final int initialIndex;
  Pages({Key? key, required this.initialIndex}) : super(key: key);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with TickerProviderStateMixin {
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    bottomTabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroudColor,
        bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
        body: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Home(),
            ShipmentPage(),
            Location(),
            Account(),
          ],
        ));
  }
}
