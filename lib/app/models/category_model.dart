class Category {
  int id;
  String name;
  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }
}

class PackageCategory {
  int id;
  String name;
  int cost;
  int insurance_fee;
  int return_fee;
  int category_id;
  PackageCategory({
    required this.id,
    required this.name,
    required this.cost,
    required this.insurance_fee,
    required this.return_fee,
    required this.category_id,
  });

  factory PackageCategory.fromMap(Map<String, dynamic> map) {
    return PackageCategory(
      id: map['id'],
      name: map['name'],
      cost: map['cost'],
      insurance_fee: map['insurance_fee'],
      return_fee: map['return_fee'],
      category_id: map['category_id'],
    );
  }
}

class PackgeList {
  String? package_id;
  String? description;
  String? weight;
  String? length;
  String? width;
  String? height;
  List? shipment_insurance;
  String? shipment_price;
  List? package_list;
  PackgeList({
    this.description,
    this.weight,
    this.length,
    this.package_id,
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
      'package_list': package_list,
    };
  }
}
