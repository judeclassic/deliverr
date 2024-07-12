import 'package:donitaa_client/app/global_widgets/appbar.dart';
import 'package:donitaa_client/app/global_widgets/auth_button.dart';
import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/repositories/shipment_repo.dart';
import 'package:donitaa_client/app/views/account/address/view_address.dart';
import 'package:donitaa_client/app/views/pages/pages.dart';
import 'package:donitaa_client/app/views/transactions/shipment/edit_shipment.dart';
import 'package:donitaa_client/app/views/transactions/shipment/shipment_page.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class ViewShipment extends StatefulWidget {
  const ViewShipment({ Key? key, required this.shipment }) : super(key: key);
  final Shipment shipment;

  @override
  _ViewShipmentState createState() => _ViewShipmentState();
}

class _ViewShipmentState extends State<ViewShipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: backIcon,
        onTap1: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Pages(initialIndex: 1,)),
            (route) => false),
        text: 'View Shipment',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              thickness: 2,
              color: divider,
            ),

            AddressEntryField(
              height: 80,
              entry: "Zone ",
              value: '${widget.shipment.zone ?? '__'} ${widget.shipment.client_last_name ?? ''}',
              onPress: (data) {
                setState(() {
                  // address.first_name = data;
                });
              },
            ),

            AddressEntryField(
              height: 80,
              entry: "Freight",
              value: '${widget.shipment.freight ?? '__'} ${widget.shipment.client_last_name ?? ''}',
              onPress: (data) {
                setState(() {
                  // address.first_name = data;
                });
              },
            ),

            AddressEntryField(
              height: 80,
              entry: "Exp Type",
              value: '${widget.shipment.exp_type ?? '__'} ${widget.shipment.client_last_name ?? ''}',
              onPress: (data) {
                setState(() {
                  // address.first_name = data;
                });
              },
            ),

            Divider(),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Client Details',
                  style: TextStyle(
                    color: grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10,),

            AddressEntryField(
              height: 80,
              entry: "Name",
              value: '${widget.shipment.client_first_name ?? '__'} ${widget.shipment.client_last_name ?? ''}',
              onPress: (data) {
                setState(() {
                  // address.first_name = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Address",
              value: widget.shipment.client_address ?? '',
              onPress: (data) {
                setState(() {
                  // address.last_name = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Phone",
              value: widget.shipment.client_phone ?? '',
              onPress: (data) {
                setState(() {
                  // address.type = data;
                });
              },
            ),

            Divider(),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Receiver Details',
                  style: TextStyle(
                    color: grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 10,),

            AddressEntryField(
              height: 80,
              entry: "Name",
              value: '${widget.shipment.receiver_first_name ?? '__'} ${widget.shipment.receiver_last_name ?? ''}',
              onPress: (data) {
                setState(() {
                  // address.first_name = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Address",
              value: widget.shipment.receiver_address ?? '',
              onPress: (data) {
                setState(() {
                  // address.last_name = data;
                });
              },
            ),
            AddressEntryField(
              height: 80,
              entry: "Phone",
              value: widget.shipment.receiver_phone ?? '',
              onPress: (data) {
                setState(() {
                  // address.type = data;
                });
              },
            ),

            AddressEntryField(
              height: 80,
              entry: "Delivery Type",
              value: widget.shipment.receiver_shipment_type ?? '',
              onPress: (data) {
                setState(() {
                  // address.type = dat
                });
              },
            ),

           
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: authButton(context, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditShipmentMode(shipment: widget.shipment,)));
              }, text: 'Edit Shipment', backGroundColor: red),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: authButton(context, () {
                confirm();
              }, text: 'End Shipment', backGroundColor: red),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> confirm() async {
    final bool? isConfirm = await showDialog<bool>(
      context: context,
      builder: (_) => WillPopScope(
        child: AlertDialog(
          title: Text('Confirm'),
          content: Text('Are you sure you want to end this shipment'),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context, false);
                Loader.show(context,
                  isAppbarOverlay: true,
                  isBottomBarOverlay: true,
                  progressIndicator: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  themeData: Theme.of(context),
                  overlayColor: Color(0x99E8EAF6));
                deleteShipment(OneShipment(shipment: widget.shipment)).then((value) {
                  Navigator.pop(context, false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pages(initialIndex: 1,)));
                  Loader.hide();
                }).catchError((err) {
                  Loader.hide();
                }).onError((error, stackTrace){
                  Loader.hide();
                });
              }
            ),
          ],
        ),
        onWillPop: () async {
          Navigator.pop(context, false);
          return true;
        },
      ),
    );

    return (isConfirm != null) ? isConfirm : false;
  }
}