import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/app/views/transactions/pages/create_shipment.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckRates extends StatefulWidget {
  CheckRates({Key? key}) : super(key: key);

  @override
  _CheckRatesState createState() => _CheckRatesState();
}

class _CheckRatesState extends State<CheckRates> {
  GlobalKey<FormState> checkRateFormkey = GlobalKey<FormState>();
  bool reveal = false;
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
        text: S.of(context).check_rates,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            dividerTopWidget(2),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Form(
                  key: checkRateFormkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      title(S.of(context).origin, black),
                      Row(
                        children: [
                          Image.asset(
                            originIcon,
                            scale: .9,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Should be a valid location';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        S.of(context).input_origin_location,
                                    suffixIcon: Image.asset(
                                      goIcon,
                                      color: grey,
                                    ),
                                    hintStyle:
                                        captionText2(13, black.withOpacity(.5)),
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
                        ],
                      ),
                      SizedBox(height: 10),
                      title(S.of(context).destination, black),
                      Row(
                        children: [
                          Image.asset(
                            destinationIcon,
                            scale: .9,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Should be a valid location';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: S
                                        .of(context)
                                        .input_destination_location,
                                    suffixIcon: Image.asset(
                                      goIcon,
                                      color: grey,
                                    ),
                                    hintStyle:
                                        captionText2(13, black.withOpacity(.5)),
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
                        ],
                      ),
                      SizedBox(height: 10),
                      title(S.of(context).package_size, black),
                      Row(
                        children: [
                          Image.asset(
                            packageIcon,
                            scale: .9,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                FormField(
                                  builder: (FormFieldState state) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                      ),
                                      isEmpty: packageSize[index] == '',
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isExpanded: false,
                                          value: packageSize[index],
                                          dropdownColor: Color(0xFFDEEFF5),
                                          icon: Image.asset(dropdownIcon),
                                          isDense: true,
                                          style: appBarTitle().merge(
                                            TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              index =
                                                  packageSize.indexOf(value);
                                            });
                                          },
                                          items: packageSize.map((value) {
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
                                  color: divider,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: authButton(context, () {
                  if (checkRateFormkey.currentState!.validate()) {
                    setState(() {
                      reveal = true;
                    });
                  }
                }, text: S.of(context).check_rate, backGroundColor: red)),
            SizedBox(height: 20),
            dividerTopWidget(6),
            reveal
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(
                          S.of(context).shipping_cost,
                          style: title4(16, black)
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 15),
                        moneyText('Rp 14.000', red, 34),
                        SizedBox(height: 15),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: authButton(
                                context,
                                () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateShipment()),
                                    (route) => false),
                                text: S.of(context).create_shipment_now))
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  int index = 0;

  List packageSize = [
    'Small 20x20x8 cm',
    'Medium 30x22x12 cm',
    'Large 35x30x25 cm',
    'Extra-Large 50x40x20 cm'
  ];
}
