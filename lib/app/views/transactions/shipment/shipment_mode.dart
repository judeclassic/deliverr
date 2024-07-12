import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:donitaa_client/app/views/transactions/shipment/card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/views/transactions/shipment/sender.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';

class ShipmentMode extends StatefulWidget {
  ShipmentMode({Key? key}) : super(key: key);

  @override
  _ShipmentModeState createState() => _ShipmentModeState();
}

class _ShipmentModeState extends State<ShipmentMode> {
  DateFormat shippinDateFormat = DateFormat('yyyy-MM-dd');
  GlobalKey<FormState> shipementInfoFormkey = GlobalKey<FormState>();
  OneShipment _oneShipment = OneShipment(shipment: Shipment());
  int shipmentMode = 1;
  int shipmentZone = 1;
  int type = 1;
  int dispatch = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
          icon: backIcon,
          onTap1: () => Navigator.pop(context),
          text: 'Shipment'),
      body: SingleChildScrollView(
        child: Form(
          key: shipementInfoFormkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              dividerTopWidget(2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: title('Shipment Zone', black),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    ShipmentBox(
                      shipmentZone: shipmentZone,
                      size: Size(120, 200),
                      padding: 20,
                      value: 1,
                      onRadio: () {
                        setState(() {
                          shipmentZone = 1;
                        });
                      },
                      text: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Domestic',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(100, 100),
                      image: domesticPng,
                    ),
                    SizedBox(width: 20),
                    ShipmentBox(
                      shipmentZone: shipmentZone,
                      size: Size(120, 200),
                      padding: 20,
                      value: 2,
                      onRadio: () {
                        setState(() {
                          shipmentZone = 2;
                        });
                      },
                      text: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'International',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(100, 100),
                      image: internationalPng,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: title('Shipment Mode', black),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    ShipmentBox(
                      shipmentZone: shipmentMode,
                      size: Size(90, 130),
                      value: 1,
                      padding: 5,
                      onRadio: () {
                        setState(() {
                          shipmentMode = 1;
                        });
                      },
                      text: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Air',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(80, 100),
                      image: airPng,
                    ),
                    SizedBox(width: 12),
                    ShipmentBox(
                      shipmentZone: shipmentMode,
                      size: Size(90, 130),
                      padding: 5,
                      value: 2,
                      onRadio: () {
                        setState(() {
                          shipmentMode = 2;
                        });
                      },
                      text: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Water',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(80, 100),
                      image: waterPng,
                    ),
                    SizedBox(width: 12),
                    ShipmentBox(
                      shipmentZone: shipmentMode,
                      size: Size(90, 130),
                      value: 3,
                      onRadio: () {
                        setState(() {
                          shipmentMode = 3;
                        });
                      },
                      padding: 5,
                      text: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Road',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(80, 100),
                      image: roadPng,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: title('Export/Import Type', black),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    ShipmentBox(
                      shipmentZone: type,
                      size: Size(120, 180),
                      padding: 20,
                      value: 1,
                      onRadio: () {
                        setState(() {
                          type = 1;
                        });
                      },
                      text: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'One Way',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(100, 100),
                      image: oneWayPng,
                    ),
                    SizedBox(width: 20),
                    ShipmentBox(
                      shipmentZone: type,
                      size: Size(120, 180),
                      padding: 20,
                      value: 2,
                      onRadio: () {
                        setState(() {
                          type = 2;
                        });
                      },
                      text: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ship & Return',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      imgSize: Size(100, 100),
                      image: shipReturnPng,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: grey, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Shipping Date',
                      textAlign: TextAlign.start,
                      style: title4(12, black),
                    ),
                    DateTimeField(
                      format: shippinDateFormat,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      initialValue: DateTime.now(),
                      validator: (val) {
                        if (val == null) {
                          return 'please select a shipping date';
                        } else {
                          _oneShipment.shipment.shipping_date =
                              shippinDateFormat.format(val);
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _oneShipment.shipment.shipping_date =
                              shippinDateFormat.format(value ?? DateTime.now());
                        });
                      },
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                          context: context,
                          locale: Locale('fr'),
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2023, 12, 31),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: authButton(context, () {
                  if (shipementInfoFormkey.currentState!.validate()) {
                    setState(() {
                      _oneShipment.shipment.zone = shipmentZone.toString();
                      _oneShipment.shipment.exp_type = type.toString();
                      _oneShipment.shipment.type = dispatch.toString();
                      _oneShipment.shipment.freight = shipmentMode.toString();
                    });
                    print(_oneShipment.shipment.shipping_date);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Sender(oneShipment: _oneShipment)),
                        (route) => true);
                  }
                }, text: 'Next', backGroundColor: red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
