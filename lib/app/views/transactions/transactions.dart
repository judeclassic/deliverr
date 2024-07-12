import 'package:donitaa_client/app/global_widgets/inputfield.dart';
import 'package:donitaa_client/app/global_widgets/texts.dart';
import 'package:donitaa_client/app/views/transactions/transaction_details.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: AppBar(
        backgroundColor: backGroudColor,
        elevation: 0,
        title: GestureDetector(
          onTap: () => transBottomSheet(context),
          child: Row(
            children: <Widget>[
              Text(
                filters.elementAt(active) ?? filters.elementAt(0),
                style: appBarTitle(),
              ),
              SizedBox(width: 5),
              Image.asset(dropdownIcon),
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: GestureDetector(
              onTap: () => print('Completed'),
              child: Text(
                'Completed',
                style: appBarTitle().copyWith(color: red),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            dividerTopWidget(2),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: ListView.builder(
                itemCount: 10,
                primary: true,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => TransDetails()),
                        (route) => true),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 5),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Image.asset(originIcon),
                                    Text('|',
                                        style: TextStyle(
                                            fontSize: 29, height: .9)),
                                    Image.asset(destinationIcon),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    title('Shipment #232-532-616', black),
                                    SizedBox(height: 10),
                                    Text(
                                      'Ovilla, TX US to Mahwah, NJ US',
                                      style: title4(
                                        12,
                                        black.withOpacity(.5),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Delivery on: 6th March 2019, 5:00PM',
                                      style: title4(
                                        12,
                                        black.withOpacity(.5),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'View Details',
                                      style: title4(
                                        12,
                                        black.withOpacity(.5),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          dividerTopWidget(1),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  int active = 0;

  List filters = [
    'Ongoing Transactions',
    'Shipment From Me',
    'Shipment To Me',
    'Others Shipments',
    'Booking DeliveryBox'
  ];
  void transBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: white,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              height: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: title('Show Transactions:', black),
                  ),
                  SizedBox(height: 5),
                  ListView.builder(
                      itemCount: filters.length,
                      primary: true,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              active = index;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              dividerTopWidget(1),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 7),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      filters.elementAt(index),
                                      style: title4(
                                          14, index == active ? black : grey),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.check,
                                      color: index == active ? red : grey,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                        );
                      })
                ],
              ));
        });
  }
}
