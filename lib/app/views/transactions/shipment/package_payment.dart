import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/models/simple/delivery_time_model.dart';
import 'package:donitaa_client/app/models/simple/payment_gateway.dart';
import 'package:donitaa_client/app/repositories/payment_gateway_repo.dart';
import 'package:donitaa_client/app/repositories/shipment_repo.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/transactions/pages/created_success.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:donitaa_client/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackagePayment extends StatefulWidget {
  final OneShipment oneShipment;
  PackagePayment({Key? key, required this.oneShipment}) : super(key: key);

  @override
  _PackagePaymentState createState() => _PackagePaymentState(oneShipment);
}

class _PackagePaymentState extends State<PackagePayment> {
  final OneShipment oneShipment;

  _PackagePaymentState(this.oneShipment);
  List<PaymentGateway> paymentGateways = <PaymentGateway>[];
  List<DeliveryTime> deliveryTimes = <DeliveryTime>[];
  int groupValue = 0;
  int senderpay = 1;
  int paygv = 0;
  int delGV = 0;
  int recieverpay = 2;

  Future<void> listForPaymentGateways() async {
    final Stream<PaymentGateway> stream = await getPaymentGateways();
    stream.listen((PaymentGateway _pamentGateway) {
      setState(() => paymentGateways.add(_pamentGateway));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  Future<void> listForDeliveryTimes() async {
    final Stream<DeliveryTime> stream = await getDeliveyTimes();
    stream.listen((DeliveryTime _deliveryTime) {
      setState(() => deliveryTimes.add(_deliveryTime));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  @override
  void initState() {
    listForPaymentGateways();
    listForDeliveryTimes();
    super.initState();
  }

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
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Payee ( Who’s paying for this shipment):',
                    style: title4(14, black),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio(
                            value: senderpay,
                            groupValue: paygv,
                            onChanged: (val) {
                              setState(() {
                                paygv = senderpay;
                              });
                            },
                          ),
                          Text(
                            'Shipper',
                            style: title4(13, black),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: recieverpay,
                            groupValue: paygv,
                            onChanged: (val) {
                              setState(() {
                                paygv = recieverpay;
                              });
                            },
                          ),
                          Text(
                            'Receiver',
                            style: title4(13, black),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            dividerTopWidget(5),
            paygv == 1 || paygv == 0
                ? Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          S.of(context).select_payment_method,
                          style: title4(17, black)
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        paymentGateways.isNotEmpty
                            ? ListView.builder(
                                itemCount: paymentGateways.length,
                                primary: true,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var _paymentGateway =
                                      paymentGateways.elementAt(index);
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              donita,
                                              height: 16,
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  200,
                                              child: Text(
                                                _paymentGateway.name,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: title4(16,
                                                        black.withOpacity(.6))
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                            Spacer(),
                                            Transform.scale(
                                              scale: 1.4,
                                              child: Radio(
                                                  value: _paymentGateway.id,
                                                  groupValue: groupValue,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      groupValue =
                                                          _paymentGateway.id;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                        dividerTopWidget(1),
                                      ],
                                    ),
                                  );
                                })
                            : Center(
                                child: Text('Loading payment gateways'),
                              ),
                      ],
                    ),
                  )
                : SizedBox(),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Select A Delivery Time',
                    style:
                        title4(17, black).copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  deliveryTimes.isNotEmpty
                      ? ListView.builder(
                          itemCount: deliveryTimes.length,
                          primary: true,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            var _deliveryTime = deliveryTimes.elementAt(index);
                            return Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 10),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Text(
                                          _deliveryTime.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: title4(
                                                  16, black.withOpacity(.6))
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Spacer(),
                                      Transform.scale(
                                        scale: 1.4,
                                        child: Radio(
                                            value: _deliveryTime.id,
                                            groupValue: delGV,
                                            onChanged: (val) {
                                              setState(() {
                                                delGV = _deliveryTime.id;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  dividerTopWidget(1),
                                ],
                              ),
                            );
                          })
                      : Center(
                          child: Text('Loading Delivery Times'),
                        ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: authButton(context, () {
                _createShipment();
              }, text: 'Create Shipment', backGroundColor: red),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future <void> _createShipment() async{
    setState(() {
      oneShipment.shipment.payment_type = paygv.toString();
      oneShipment.shipment.payment_method_id =
          paygv == 1 ? groupValue.toString() : null;
      oneShipment.shipment.delivery_time = delGV.toString();
      oneShipment.shipment.shipment_price = '100';
      oneShipment.shipment.total_weight =
          getTotalWeight(oneShipment);
      oneShipment.group = '11';
      oneShipment.token = currentUser.value.access_token;
    });
    Loader.show(context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      themeData: Theme.of(context),
      overlayColor: Color(0x99E8EAF6));
    await createShipment(oneShipment);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => CreationSuccess()),
        ModalRoute.withName('/home'));
    Loader.hide();
  }

  String getTotalWeight(OneShipment _oneShipment) {
    double total = 0;
    for (var pack in _oneShipment.package!) {
      setState(() {
        total = total + double.parse(pack.weight ?? '0');
      });
    }
    return total.toString();
  }
}
