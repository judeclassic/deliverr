class Country {
  int id;
  String? name;
  String? phonecode;

  Country({
    required this.id,
    this.name,
    this.phonecode
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'],
      name: map['name'],
      phonecode: map['phonecode']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phonecode': phonecode
    };
  }
}

class States {
  int id;
  int country_id;
  String name;
  String latitude;
  String longitude;
  States({
    required this.id,
    required this.country_id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country_id': country_id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory States.fromMap(Map<String, dynamic> map) {
    return States(
      id: map['id'],
      country_id: map['country_id'],
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}

class Area {
  int id;
  int state_id;
  String name;
  Area({
    required this.id,
    required this.state_id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'state_id': state_id,
      'name': name,
    };
  }

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      id: map['id'],
      state_id: map['state_id'],
      name: map['name'],
    );
  }
}
