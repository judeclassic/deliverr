import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/app/repositories/shipment_repo.dart';
import 'package:donitaa_client/app/views/transactions/shipment/widgets/shipment_tile.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

class ShipmentPage extends StatefulWidget {
  const ShipmentPage({ Key? key }) : super(key: key);

  @override
  _ShipmentPageState createState() => _ShipmentPageState();
}

class _ShipmentPageState extends State<ShipmentPage> {
  List<String> filters = ['Name', 'Time', 'Price'];
  List<Shipment> shipments = [];
  int active = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async{
    if (allCountries.isEmpty){
      await getAllCountries();
    }
    Stream<Shipment> data = await getShipments();
    data.listen(
      (shipment) {
        setState(() {
          shipments.add(shipment);
        });
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroudColor,
        elevation: 0,
        title: GestureDetector(
          child: Row(
            children: <Widget>[
              Text(
                filters.elementAt(active),
                style: appBarTitle(),
              ),
              SizedBox(width: 5),
              Image.asset(dropdownIcon),
            ],
          ),
        ),
      ),
      backgroundColor: backGroudColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 2, bottom: 10),
                child: SizedBox(
                  child: Text(
                    'Shipment Records',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              Container(
                child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                primary: true,
                itemCount: shipments.length,
                physics: ScrollPhysics(),
                  itemBuilder: (context, index){
                    return ShipmentTile(
                      shipment: shipments[index],
                    );
                  }
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}