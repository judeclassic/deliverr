class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? access_token;
  String? token_type;
  String? type;
  String? phone;
  String? address;
  String? city;
  int? postal_code;
  int? countryId;
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.access_token,
    this.token_type,
    this.type,
    this.phone,
    this.address,
    this.city,
    this.postal_code,
    this.countryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'access_token': access_token,
      'token_type': token_type,
      'type': type,
      'phone': phone,
      'address': address,
      'city': city,
      'postal_code': postal_code,
      'countryId': countryId
    };
  }

  factory User.fromJSON(Map<String, dynamic> map) {
    return User(
      id: map['user']['id'],
      name: map['user']['name'],
      email: map['user']['email'],
      access_token: map['access_token'],
      token_type: map['token_type'],
      type: map['user']['type'],
      phone: map['user']['phone'],
      address: map['user']['address'],
      city: map['user']['city'],
      postal_code: map['user']['postal_code'],
      countryId: map['user']['country'] != null
          ? map['user']['country']['countryId']
          : null,
      password: null,
    );
  }
}
