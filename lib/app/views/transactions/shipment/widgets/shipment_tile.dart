import 'package:donitaa_client/app/models/shipment_model.dart';
import 'package:donitaa_client/app/models/simple/country_model.dart';
import 'package:donitaa_client/app/repositories/country_repo.dart';
import 'package:donitaa_client/app/repositories/user_repo.dart';
import 'package:donitaa_client/app/views/transactions/shipment/view_shipment.dart';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';

class ShipmentTile extends StatelessWidget {
  const ShipmentTile({ Key? key, required this.shipment }) : super(key: key);
  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    print(shipment.toMap());
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=> ViewShipment(shipment: shipment)));
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(8.0),
        height: 110,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: backGroudColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: grey, blurRadius: 10, offset: Offset(0, 5)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  child: Text(
                    'Pickup date :   ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
      
                SizedBox(width: 10,),
      
                SizedBox(
                  child: Text(
                    shipment.pickup_date == 'null' ? 'Unknown' : shipment.pickup_date ?? 'Unknown',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  child: Text(
                    'from :   ',
                  style: appBarTitle(),
                  ),
                ),
      
                SizedBox(
                  child: Text(
                    (shipment.from_country_id == null) ? '' : (allCountries.firstWhere((element) => element.phonecode!.contains(shipment.from_country_id!), orElse: ()=> Country(id: 0, name: null)).name
                    ?? 
                    allCountries.firstWhere((element) => element.phonecode!.contains(currentUser.value.countryId.toString()), orElse: ()=> allCountries.lastWhere((element) => element.phonecode == '1')).name ?? '')
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                SizedBox(
                  child: Text(
                    'To :   ',
                  style: appBarTitle(),
                  ),
                ),
      
                SizedBox(
                  child: Text(
                    // shipment.from_country_id ?? '',
                    (shipment.to_country_id == null)
                    ?
                    ''
                    :
                    (shipment.from_country_id == null) ? '' : (allCountries.firstWhere((element) => element.phonecode!.contains(shipment.from_country_id!), orElse: ()=> Country(id: 0, name: null)).name
                    ?? 
                    allCountries.firstWhere((element) => element.phonecode!.contains(currentUser.value.countryId.toString()), orElse: ()=> allCountries.lastWhere((element) => element.phonecode == '1')).name ?? '')
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}