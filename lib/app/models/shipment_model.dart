import 'dart:convert';

import 'package:flutter/foundation.dart';

class Shipment {
  String? shipping_date;
  String? zone;
  String? freight;
  String? exp_type;
  String? client_company;
  String? type;
  String? client_first_name;
  String? client_last_name;
  String? pickup_date;
  String? client_address;
  String? client_address_2;
  String? from_country_id;
  String? from_state_id;
  String? from_area_id;
  String? client_zip_code;
  String? client_email;
  String? client_phone;
  String? receiver_company;
  String? receiver_shipment_type;
  String? receiver_first_name;
  String? receiver_last_name;
  String? receiver_address;
  String? receiver_address_2;
  String? to_country_id;
  String? to_state_id;
  String? to_area_id;
  String? receiver_zip_code;
  String? receiver_email;
  String? receiver_phone;
  String? payment_type;
  String? payment_method_id;
  String? delivery_time;
  String? shipment_price;
  String? total_weight;
  Shipment({
    this.shipping_date,
    this.zone,
    this.freight,
    this.exp_type,
    this.client_company,
    this.type,
    this.client_first_name,
    this.client_last_name,
    this.pickup_date,
    this.client_address,
    this.client_address_2,
    this.from_country_id,
    this.from_state_id,
    this.from_area_id,
    this.client_zip_code,
    this.client_email,
    this.client_phone,
    this.receiver_company,
    this.receiver_shipment_type,
    this.receiver_first_name,
    this.receiver_last_name,
    this.receiver_address,
    this.receiver_address_2,
    this.to_country_id,
    this.to_state_id,
    this.to_area_id,
    this.receiver_zip_code,
    this.receiver_email,
    this.receiver_phone,
    this.payment_type,
    this.payment_method_id,
    this.delivery_time,
    this.shipment_price,
    this.total_weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'shipping_date': shipping_date,
      'zone': zone,
      'freight': freight,
      'exp_type': exp_type,
      'client_company': client_company,
      'type': type,
      'client_first_name': client_first_name,
      'client_last_name': client_last_name,
      'pickup_date': pickup_date,
      'client_address': client_address,
      'client_address_2': client_address_2,
      'from_country_id': from_country_id,
      'from_state_id': from_state_id,
      'from_area_id': from_area_id,
      'client_zip_code': client_zip_code,
      'client_email': client_email,
      'client_phone': client_phone,
      'receiver_company': receiver_company,
      'receiver_shipment_type': receiver_shipment_type,
      'receiver_first_name': receiver_first_name,
      'receiver_last_name': receiver_last_name,
      'receiver_address': receiver_address,
      'receiver_address_2': receiver_address_2,
      'to_country_id': to_country_id,
      'to_state_id': to_state_id,
      'to_area_id': to_area_id,
      'receiver_zip_code': receiver_zip_code,
      'receiver_email': receiver_email,
      'receiver_phone': receiver_phone,
      'payment_type': payment_type,
      'payment_method_id': payment_method_id,
      'delivery_time': delivery_time,
      'shipment_price': shipment_price,
      'total_weight': total_weight,
    };
  }

  factory Shipment.fromMap(Map<String, dynamic> map) {
    return Shipment(
      shipping_date: map['shipping_date'],
      zone: map['zone'],
      freight: map['freight'],
      exp_type: map['exp_type'],
      client_company: map['client_company'],
      type: map['type'],
      client_first_name: map['client_first_name'],
      client_last_name: map['client_last_name'],
      pickup_date: map['pickup_date'].toString(),
      client_address: map['client_address'],
      client_address_2: map['client_address_2'],
      from_country_id: map['from_country_id'].toString(),
      from_state_id: map['from_state_id'].toString(),
      from_area_id: map['from_area_id'].toString(),
      client_zip_code: map['client_zip_code'].toString(),
      client_email: map['client_email'],
      client_phone: map['client_phone'].toString(),
      receiver_company: map['receiver_company'],
      receiver_shipment_type: map['receiver_shipment_type'],
      receiver_first_name: map['receiver_first_name'],
      receiver_last_name: map['receiver_last_name'],
      receiver_address: map['receiver_address'],
      receiver_address_2: map['receiver_address_2'],
      to_country_id: map['to_country_id'].toString(),
      to_state_id: map['to_state_id'].toString(),
      to_area_id: map['to_area_id'].toString(),
      receiver_zip_code: map['receiver_zip_code'].toString(),
      receiver_email: map['receiver_email'],
      receiver_phone: map['receiver_phone'].toString(),
      payment_type: map['payment_type'].toString(),
      payment_method_id: map['payment_method_id'].toString(),
      delivery_time: map['delivery_time'].toString(),
      shipment_price: map['shipment_price'].toString(),
      total_weight: map['total_weight'].toString(),
    );
  }
}

class Package {
  String? package_id;
  String? description;
  String? weight;
  String? length;
  String? width;
  String? height;
  List<String>? shipment_insurance;
  String? shipment_price;
  List<PackageList>? package_list;
  Package({
    this.package_id,
    this.description,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.shipment_insurance,
    this.shipment_price,
    this.package_list,
  });

  Map<String, dynamic> toMap() {
    return {
      'package_id': package_id,
      'description': description,
      'weight': weight,
      'length': length,
      'width': width,
      'height': height,
      'shipment_insurance': shipment_insurance,
      'shipment_price': shipment_price,
      'package_list': package_list != null ? package_list!.map((x) => x.toMap()).toList() : [],
    };
  }
}

class PackageList {
  String? item_name;
  String? description;
  String? qty;
  PackageList({
    this.item_name,
    this.description,
    this.qty,
  });

  Map<String, dynamic> toMap() {
    return {
      'item_name': item_name,
      'description': description,
      'qty': qty,
    };
  }
}

class OneShipment {
  OneShipment({
    this.token,
    this.group,
    required this.shipment,
    this.package,
  });
  String? token;

  Shipment shipment;
  String? group;
  List<Package>? package;

  Map<String, dynamic> toMap() => 
  package == null ?
  {
    // "_token": token,
    "Shipment": shipment.toMap(),
    // "group": group,
    // "Package": List<dynamic>.from(package!.map((x) => x.toMap())),
  }
  :
  {
    "_token": token,
    "Shipment": shipment.toMap(),
    "group": group,
    "Package": List<dynamic>.from(package!.map((x) => x.toMap())),
  };

}


class AllShipment {
  AllShipment({
    this.token,
    this.group,
    required this.shipment,
    this.package,
  });

  String? token;

  Shipment shipment;
  String? group;
  List<Package>? package;

  Map<String, dynamic> toMap() => {
        "_token": token,
        "Shipment": shipment.toMap(),
        "group": group,
        "Package": List<dynamic>.from(package!.map((x) => x.toMap())),
      };
}

class ShipmentList {
  final String? message;
  final List<Shipment>? shipments;

  ShipmentList({
    this.message,
    this.shipments,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'shipments': shipments!.map((x) => x.toMap()).toList(),
    };
  }

  factory ShipmentList.fromMap(Map<String, dynamic> map) {
    return ShipmentList(
      message: map['message'] ?? '',
      shipments: List<Shipment>.from(map['data']?.map((x) => Shipment.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShipmentList.fromJson(String source) => ShipmentList.fromMap(json.decode(source));

  @override
  String toString() => 'ShipmentList(message: $message, shipments: $shipments)';

}
