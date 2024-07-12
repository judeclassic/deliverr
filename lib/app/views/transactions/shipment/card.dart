import 'package:donitaa_client/common/strings/resources.dart';
import 'package:flutter/material.dart';

class ShipmentBox extends StatelessWidget {
  const ShipmentBox({
    Key? key,
    required this.shipmentZone,
    required this.image,
    required this.imgSize,
    required this.size,
    required this.padding,
    required this.value,
    required this.text,
    required this.onRadio,
  }) : super(key: key);


  final int shipmentZone;
  final String image;
  final Size imgSize;
  final Size size;
  final double padding;
  final int value;
  final Widget text;
  final Function onRadio;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: red.withOpacity(.4),
          ),
          child: Image.asset(
            image,
            height: imgSize.height,
            width: imgSize.width,
          ),
        ),
        Container(
          height: size.height,
          padding: EdgeInsets.only(bottom: padding, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Radio(
                  value: value,
                  groupValue: shipmentZone,
                  activeColor: white,
                  onChanged: (val) {
                    onRadio();
                  }),
              text
            ],
          ),
        )
      ],
    );
  }
}