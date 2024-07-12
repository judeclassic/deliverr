class PaymentGateway {
  int id;
  String name;
  String type;
  PaymentGateway({
    required this.id,
    required this.name,
    required this.type,
  });

  factory PaymentGateway.fromJSON(Map<String, dynamic> map) {
    return PaymentGateway(
      id: map['id'],
      name: map['name'],
      type: map['type'],
    );
  }
}
