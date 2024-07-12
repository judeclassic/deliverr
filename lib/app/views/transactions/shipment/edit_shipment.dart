import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:donitaa_client/app/repositories/shipment_repo.dart';
import 'package:donitaa_client/app/views/transactions/shipment/card.dart';
import 'package:donitaa_client/app/views/transactions/shipment/shipment_page.dart';
import 'package:donitaa_client/app/views/transactions/shipment/view_shipment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';

import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/views/transactions/shipment/sender.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';

class EditShipmentMode extends StatefulWidget {
  EditShipmentMode({Key? key, required this.shipment}) : super(key: key);

  final Shipment shipment;

  @override
  _EditShipmentModeState createState() => _EditShipmentModeState();
}

class _EditShipmentModeState extends State<EditShipmentMode> {
  DateFormat shippinDateFormat = DateFormat('yyyy-MM-dd');
  GlobalKey<FormState> shipementInfoFormkey = GlobalKey<FormState>();
  OneShipment _oneShipment = OneShipment(shipment: Shipment());
  int shipmentMode = 1;
  int shipmentZone = 1;
  int type = 1;
  int dispatch = 1;

  @override
  void initState() {
    super.initState();
    shipmentZone = (widget.shipment.zone == 'Domestic') ? 1 : 2;
    shipmentMode = (widget.shipment.freight == 'Air Freight')
        ? 1
        : (widget.shipment.freight == 'Water Freight')
            ? 2
            : 3;
    type = (widget.shipment.exp_type == 'One Way') ? 1 : 2;
    _oneShipment = OneShipment(shipment: widget.shipment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: CustomAppBar(
          icon: backIcon,
          onTap1: () => Navigator.pop(context),
          text: 'Edit Shipment'),
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
                      image: landPng,
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
                      image: seaPng,
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
                      image: seaPng,
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
                      image: seaPng,
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
                      image: landPng,
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
                      image: seaPng,
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
                      image: seaPng,
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
                      initialValue: widget.shipment.shipping_date == null
                          ? DateTime.parse(widget.shipment.shipping_date!)
                          : DateTime.now(),
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
                  _updateShipment();
                }, text: 'Save', backGroundColor: red),
              ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              //   child: authButton(context, () {
              //     if (shipementInfoFormkey.currentState!.validate()) {
              //       setState(() {
              //         _oneShipment.shipment.zone = shipmentZone.toString();
              //         _oneShipment.shipment.exp_type = type.toString();
              //         _oneShipment.shipment.type = dispatch.toString();
              //         _oneShipment.shipment.freight = shipmentMode.toString();
              //       });
              //       print(_oneShipment.shipment.shipping_date);
              //       Navigator.pushAndRemoveUntil(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) =>
              //                   Sender(oneShipment: _oneShipment)),
              //           (route) => true);
              //     }
              //   }, text: 'Edit Client Details', backGroundColor: red),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateShipment() async {
    if (shipementInfoFormkey.currentState!.validate()) {
      Loader.show(context,
          isAppbarOverlay: true,
          isBottomBarOverlay: true,
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          themeData: Theme.of(context),
          overlayColor: Color(0x99E8EAF6));
      updateShipment(OneShipment(
        shipment: widget.shipment,
      )).then((value) {
        Navigator.pop(context, false);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ViewShipment(
                      shipment: _oneShipment.shipment,
                    )));
        Loader.hide();
      }).catchError((err) {
        Loader.hide();
      }).onError((error, stackTrace) {
        Loader.hide();
      });
    }
  }
}
