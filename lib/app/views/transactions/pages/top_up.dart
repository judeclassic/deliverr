import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/app/views/transactions/pages/confirm_top_up.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';

class TopUp extends StatefulWidget {
  TopUp({Key? key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  TextEditingController topAmount = TextEditingController();
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
        text: S.of(context).myCourier_balance,
        icon1: refreshhistoryIcon,
        onTap2: () => print('Refreshing History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    red.withOpacity(.6),
                    red.withOpacity(.7),
                    red,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).myCourier_balance,
                    style: captionText1().merge(TextStyle(fontSize: 13)),
                  ),
                  moneyText('Rp 500.000', white, 28)
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              child: Text(
                S.of(context).top_up_balance,
                style: appBarTitle(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: topAmount,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: S.of(context).enter_top_up_amount,
                      hintStyle: captionText2(13, black.withOpacity(.5)),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 0,
                    color: divider,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 40,
                child: ListView.builder(
                    itemCount: amounts.length,
                    primary: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            topAmount.text = amounts[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: red.withOpacity(.05),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(right: 20),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          alignment: Alignment.center,
                          child: moneyText(amounts[index], red, 18),
                        ),
                      );
                    })),
            dividerTopWidget(6),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).payment_method,
                      style: appBarTitle()
                          .merge(TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormField(
                          builder: (FormFieldState state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                              isEmpty: payMedthos[index] == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: false,
                                  value: payMedthos[index],
                                  dropdownColor: Color(0xFFDEEFF5),
                                  icon: Image.asset(dropdownIcon),
                                  isDense: true,
                                  style: appBarTitle().merge(
                                    TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      index = payMedthos.indexOf(value);
                                    });
                                  },
                                  items: payMedthos.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(
                          thickness: 1,
                          height: 0,
                          color: divider,
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(
                    context,
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmTopUp())),
                    text: S.of(context).confirmation,
                    backGroundColor: red))
          ],
        ),
      ),
    );
  }

  int index = 0;
  List amounts = ['50.00', '100.00', '500.00', '1000.00', '5000.00'];
  List payMedthos = [
    'ATM & Internet Banking',
    'Stripe payment',
    'Bank Transfer',
    'Paypal payment'
  ];
}
