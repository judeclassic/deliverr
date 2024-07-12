import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  Tracking({Key? key}) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: backIcon,
        text: S.of(context).tracking,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Pages(initialIndex: 0)),
            (route) => false),
        icon1: scanIcon,
        onTap2: () => print("Hello world"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            dividerTopWidget(2),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: S.of(context).tracking_page_hintext,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey, width: 1.5),
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 5,
                    vertical: 10),
                child: authButton(context, () => print('Track button'),
                    text: S.of(context).check, backGroundColor: red)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: seeAllRow(S.of(context).history_tracking,
                    () => print("See all trackings"), context)),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListView.builder(
                    itemCount: 10,
                    primary: true,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                moneyText('MYC2021012900001', black, 16),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: index == 0
                                        ? orange
                                        : index == 2
                                            ? red
                                            : green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    trackingStatus(index),
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        S.of(context).from,
                                        style: captionText2(
                                          13,
                                          black.withOpacity(.5),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'JAKARTA',
                                        style: title4(15, black),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        S.of(context).to,
                                        style: captionText2(
                                          13,
                                          black.withOpacity(.5),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'RIFKI ARBA',
                                        style: title4(15, black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '24 May 2021' + '   ' + '12:20',
                              style: title4(14, black.withOpacity(.4)),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  String trackingStatus(int index) {
    if (index == 0) {
      return S.of(context).on_progress;
    } else if (index == 2) {
      return S.of(context).cancelled;
    } else {
      return S.of(context).delivered;
    }
  }
}
