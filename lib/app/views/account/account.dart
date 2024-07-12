import 'dart:developer';

import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/account/address/addresses.dart';
import 'package:donitaa_client/app/views/account/address/contact_us.dart';
import 'package:donitaa_client/app/views/account/address/edit_profile.dart';
import 'package:donitaa_client/app/views/account/address/private_policy.dart';
import 'package:donitaa_client/app/views/account/address/reedem_promo_code.dart';
import 'package:donitaa_client/app/views/account/address/term_conditions.dart';
import 'package:donitaa_client/app/views/auth/login.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/account_widgets.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 35),
              padding: EdgeInsets.symmetric(vertical: 20),
              // height: 200,

              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 20,
                            offset: Offset(4, 4),
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage(userImage),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      currentUser.value.name ?? '',
                      style: appBarTitle(),
                    ),
                    SizedBox(height: 7),
                    Text(
                      currentUser.value.phone ?? '',
                      style: TextStyle(
                        fontSize: 10,
                        color: grey,
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: authButton(
                        context,
                        () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                            (route) => true);
                        },
                        backGroundColor: red,
                        text: 'Edit Profile',
                      ),
                    )
                  ],
                ),
              ),
            ),
            dividerTopWidget(6),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  title("Account", black),
                  SizedBox(height: 17),
                  accountListItem(
                      addressIcon,
                      "Saved Address",
                      () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedAddress()),
                          (route) => true)),
                  dividerWidget(),
                  accountListItem(rewardsIcon, "My Reward", () {
                    print("Reward");
                  }),
                  dividerWidget(),
                  accountListItem(promoIcon, "Redeem Promo Code", () {
                    print("Redeem Promo Code");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RedeemPromoPage()
                      )
                    );
                  }),
                  dividerWidget(),
                  SizedBox(height: 10),
                  title("General", black),
                  SizedBox(height: 17),
                  accountListItem(settingsIcon, "Settings", () {
                    print("Two");
                  }),
                  dividerWidget(),
                  accountListItem(helpIcon, "Help & Support", () {
                    print("Two");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUsPage()
                      )
                    );
                  }),
                  dividerWidget(),
                  accountListItem(termsIcon, "Term & Conditions", () {
                    print("Two");
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => TermsConditionPage())
                    );
                  }),
                  dividerWidget(),
                  accountListItem(policyIcon, "Privacy Policy", () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => PrivatePolicyPage())
                    );
                  }),
                  dividerWidget(),
                  accountListItem(
                    policyIcon,
                    "Log Out",
                    (){
                      logout();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()),
                          (route) => true);
                    }),
                  dividerWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  printUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    log(_prefs.getString('current_user').toString());
  }
}
