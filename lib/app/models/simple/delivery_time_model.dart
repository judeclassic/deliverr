class DeliveryTime {
  String name;
  int id;
  int cost;
  DeliveryTime({
    required this.name,
    required this.id,
    required this.cost,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'cost': cost,
    };
  }

  factory DeliveryTime.fromMap(Map<String, dynamic> map) {
    return DeliveryTime(
      name: map['name'],
      id: map['id'],
      cost: map['cost'],
    );
  }
}
