import 'dart:async';
import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> with AutomaticKeepAliveClientMixin {
  Completer<GoogleMapController> _controller = Completer();
  int index = 0;

  List<DropdownMenuItem<LatLng>> locations = [
    DropdownMenuItem<LatLng>(
      value: LatLng(31.4582838,74.2509439),
      child: Text('Australia'),
    ),
    
    DropdownMenuItem<LatLng>(
      value: LatLng(5.3572167,-4.0430869),
      child: Text("Cote D'Ivoire (Ivory Coast)"),
    ),

    DropdownMenuItem<LatLng>(
      value: LatLng(7.4291893,-11.1121834),
      child: Text("Guinea"),
    ),
  ];


  static final CameraPosition _australia = CameraPosition(
    target: LatLng(31.4582838,74.2509439),
    zoom: 14.4746,
  );

      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      // appBar: AppBar(
      //   backgroundColor: backGroudColor,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                mapType: MapType.normal,
                scrollGesturesEnabled: false,
                rotateGesturesEnabled: false,
                initialCameraPosition: _australia,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Positioned(
              top: 7,
              left: 20,
              width: MediaQuery.of(context).size.width - 40,
              child: Container(
                padding: EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                margin: EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: grey,
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 5),
                          ),
                          isEmpty: false,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<LatLng>(
                              value: locations[index].value,
                              dropdownColor: Color(0xFFDEEFF5),
                              icon: Image.asset(dropdownIcon),
                              isDense: true,
                              onChanged: (newValue) {
                                if (newValue == null) return;
                                if (index !=
                                      locations.indexWhere((val)=> val.value == newValue)) {
                                    setState(() {
                                      index =
                                          locations.indexWhere((val) => val.value == newValue);
                                    });
                                  }
                                goToLocation(newValue);
                              },
                              items: locations,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToLocation(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    setState(() {
      
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: position,
      zoom: 15.5,
      tilt: 50
    )));
  }

  @override
  bool get wantKeepAlive => true;
}