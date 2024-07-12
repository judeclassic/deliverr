import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/app/views/transactions/pages/package_details.dart';
import 'package:donitaa_client/app/views/transactions/pages/payment.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateShipment extends StatefulWidget {
  CreateShipment({Key? key}) : super(key: key);

  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
  bool agreed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Pages(initialIndex: 0)),
            (route) => false),
        text: S.of(context).new_hipment,
        buttonText: S.of(context).save.toUpperCase(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            dividerTopWidget(2),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: red.withOpacity(.05),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: <Widget>[
                          Image.asset(originIcon),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                S.of(context).pickup,
                                style: title4(
                                  14,
                                  black.withOpacity(.4),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Rifki Aflaza Arba',
                                style: title4(16, black)
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Jl. Sawah Lunto No. 46B',
                                style: title4(
                                  12,
                                  black.withOpacity(.4),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(height: 15),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: red.withOpacity(.05),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: <Widget>[
                          Image.asset(destinationIcon),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                S.of(context).destination,
                                style: title4(
                                  14,
                                  black.withOpacity(.4),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Zainal Arifin',
                                style: title4(16, black)
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Jl. Kp. Dalam No.15',
                                style: title4(
                                  12,
                                  black.withOpacity(.4),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
            dividerTopWidget(6),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: red.withOpacity(.03),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(calenderSvg),
                            SizedBox(width: 10),
                            Text(
                              S.of(context).set_estimated_time,
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => print('Info about'),
                              child: SvgPicture.asset(infoSvg),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            Text(
                              S.of(context).pickup,
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '| ',
                              style: appBarTitle(),
                            ),
                            Text(
                              'May 23, 16:00 - 18:00',
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, color: red, size: 18),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: <Widget>[
                            Text(
                              S.of(context).arrival,
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '| ',
                              style: appBarTitle(),
                            ),
                            Text(
                              'May 24, 10:00 - 14:00',
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, color: red, size: 18),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: red.withOpacity(.03),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(packageSvg),
                            SizedBox(width: 10),
                            Text(
                              S.of(context).edit_package_details,
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            Text(
                              S.of(context).small,
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '| ',
                              style: appBarTitle(),
                            ),
                            Text(
                              'Book & Documents',
                              style: title4(16, black).copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, color: red, size: 18),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            dividerTopWidget(6),
            Container(
              margin: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: red.withOpacity(.03),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Text(
                      S.of(context).total_payment + ": Rp 8.000",
                      style: title4(
                        14,
                        black,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pages(initialIndex: 0))),
                      child: Text(
                        S.of(context).details,
                        style: title4(16, red)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: agreed,
                        onChanged: (val) {
                          setState(() {
                            agreed = val!;
                          });
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 88,
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            text: S.of(context).i_agree,
                            style: title4(
                              10,
                              black.withOpacity(.4),
                            ),
                            children: [
                              TextSpan(
                                text: ' ' + S.of(context).disclimer + ' ',
                                style: title4(
                                  12,
                                  red,
                                ).copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: S
                                    .of(context)
                                    .to_use_donitaa_services_agreement,
                                style: title4(
                                  10,
                                  black.withOpacity(.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  authButton(
                      context,
                      () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Payment()),
                          (route) => true),
                      text: S.of(context).pay_now,
                      backGroundColor: agreed == true ? red : grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
