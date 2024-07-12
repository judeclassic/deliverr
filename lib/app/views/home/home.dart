import 'dart:developer';

import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/address_model.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/home/widgets/home_widgets.dart';
import 'package:donitaa_client/app/views/transactions/pages/check_rates.dart';
import 'package:donitaa_client/app/views/transactions/pages/top_up.dart';
import 'package:donitaa_client/app/views/transactions/pages/tracking.dart';
import 'package:donitaa_client/app/views/transactions/shipment/shipment_mode.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: AppBar(
        backgroundColor: backGroudColor,
        elevation: 0,
        title: SvgPicture.asset(
          donita,
          height: 20,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              print("GO TO REWARDS");
              final Stream<Address> stream = await getAddresses();
              stream.listen((Address _address) {
                log(_address.id.toString());
              });
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: red.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: <Widget>[
                    Image.asset(rewardsIcon),
                    SizedBox(width: 5),
                    Text(
                      'My Rewards',
                      style: TextStyle(
                        color: red,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      red.withOpacity(.8),
                      red.withOpacity(.5),
                      red,
                      red.withOpacity(.4),
                      red.withOpacity(.7),
                      red
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          S.of(context).account_balance,
                          style: captionText1(),
                        ),
                        moneyText('Rp 500.00', white, 19)
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => TopUp()),
                          (route) => true),
                      child: Row(
                        children: <Widget>[
                          moneyText(S.of(context).top_up, white, 16),
                          SizedBox(width: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.add,
                              color: red,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    homeOperationBtn(
                        calculateIcon,
                        S.of(context).check_rates,
                        () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckRates()),
                            (route) => true)),
                    homeOperationBtn(
                      createshipmentIcon,
                      S.of(context).create_shipment,
                      () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShipmentMode()),
                          (route) => true),
                    ),
                    homeOperationBtn(
                        trackIcon,
                        S.of(context).tracking,
                        () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Tracking()),
                            (route) => true))
                  ],
                ),
              ),
              seeAllRow(S.of(context).highlights, () {
                //this is the see all staff
              }, context),
              Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image.asset(homeslider),
                        );
                      })),
              // seeAllRow(S.of(context).special_promo, () {
              //   //this is the see all staff
              // }, context),
              // Container(
              //   height: 150,
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   color: backGroudColor,
              //   child: ListView.builder(
              //     itemCount: 10,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         width: 140,
              //         height: 140,
              //         decoration: BoxDecoration(
              //             color: white,
              //             boxShadow: [
              //               BoxShadow(
              //                 color: black.withOpacity(.3),
              //                 blurRadius: .3,
              //                 offset: Offset(1, 1),
              //               ),
              //             ],
              //             borderRadius: BorderRadius.circular(10)),
              //         margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               width: 140,
              //               height: 90,
              //               decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage(specialpromo),
              //                       fit: BoxFit.fill)),
              //             ),
              //             SizedBox(height: 5),
              //             Container(
              //               padding: EdgeInsets.symmetric(
              //                   horizontal: 5, vertical: 5),
              //               child: Text(
              //                 'Share your Referral Codeand Get Free MyCourier...',
              //                 overflow: TextOverflow.ellipsis,
              //                 maxLines: 2,
              //                 style: TextStyle(
              //                     color: black,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w500),
              //               ),
              //             )
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // seeAllRow(S.of(context).highlights, () {
              //   //this is the see all staff
              // }, context),
              // Container(
              //     height: 130,
              //     margin: EdgeInsets.symmetric(vertical: 20),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: ListView.builder(
              //       itemCount: 10,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Container(
              //           margin: EdgeInsets.only(right: 10),
              //           child: Image.asset(homeslider),
              //         );
              //       }
              //     )
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
