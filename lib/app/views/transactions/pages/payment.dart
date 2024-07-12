import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/views/transactions/pages/created_success.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool donitaaa = false;
  int donitaa = 0;
  int goPay = 1;
  int dana = 2;
  int groupValue = 0;
  int cashOnPickUp = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pop(context),
        text: S.of(context).payment_method,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            dividerTopWidget(2),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        S.of(context).order_id,
                        style: title4(13, black),
                      ),
                      Text(
                        'UAHAA-AASXX-AASXXX-XXASS-11212',
                        style: title4(13, black),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: black.withOpacity(.7),
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.of(context).total_payment,
                            style: title4(14, black),
                          ),
                          moneyText('Rp 8.000', red, 19)
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => print('This is the total payment'),
                        child:
                            Icon(Icons.arrow_forward_ios, size: 18, color: red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            dividerTopWidget(5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (groupValue != donitaa) {
                        setState(() {
                          donitaaa = true;
                        });
                      } else {
                        setState(() {
                          donitaaa = false;
                        });
                      }
                      print('Show error');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: red.withOpacity(.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(promoSvg),
                          SizedBox(width: 15),
                          Text(
                            S.of(context).chatper_with_promo,
                            style: title4(16, black)
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 18, color: red),
                        ],
                      ),
                    ),
                  ),
                  donitaaa
                      ? Text(
                          S
                              .of(context)
                              .promo_only_available_on_donitaa_balanace,
                          style: TextStyle(color: red),
                        )
                      : SizedBox()
                ],
              ),
            ),
            dividerTopWidget(5),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).select_payment_method,
                    style:
                        title4(17, black).copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    S.of(context).e_wallet,
                    style:
                        title4(15, black).copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        donita,
                        height: 16,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).myCourier_balance,
                            style: title4(16, black.withOpacity(.6))
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Saldo : Rp 500.000',
                            style: title4(10, black.withOpacity(.6))
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 1.4,
                        child: Radio(
                            value: donitaa,
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                setState(() {
                                  groupValue = donitaa;
                                });
                                ;
                              });
                            }),
                      ),
                    ],
                  ),
                  dividerTopWidget(1),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        donita,
                        height: 16,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gopay | Cashback\n 100%(S&K)',
                            style: title4(16, black.withOpacity(.6))
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 1.4,
                        child: Radio(
                            value: goPay,
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                groupValue = goPay;
                              });
                            }),
                      ),
                    ],
                  ),
                  dividerTopWidget(1),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        donita,
                        height: 16,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DANA',
                            style: title4(16, black.withOpacity(.6))
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 1.4,
                        child: Radio(
                            value: dana,
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                groupValue = dana;
                              });
                            }),
                      ),
                    ],
                  ),
                  dividerTopWidget(2),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text(
                        S.of(context).cash_on_pickup,
                        style: title4(15, black)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 1.4,
                        child: Radio(
                            value: cashOnPickUp,
                            groupValue: groupValue,
                            onChanged: (val) {
                              setState(() {
                                groupValue = cashOnPickUp;
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  authButton(
                      context,
                      () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreationSuccess()),
                          ModalRoute.withName('/home')),
                      text: S.of(context).pay_now,
                      backGroundColor: red),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
