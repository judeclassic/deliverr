// ignore_for_file: non_constant_identifier_names

class Address {
  int? id;
  String? name;
  String? phone;
  String? type;
  String? client_id;
  String? address;
  int? area_id;
  int? state_id;
  int? country_id;
  String? is_archive;
  String? created_at;
  String? updated_at;
  String? zip_code;
  int? user_id;
  int? is_default;
  String? first_name;
  String? last_name;

  Address({
    this.id,
    this.name,
    this.phone,
    this.type,
    this.client_id,
    this.address,
    this.area_id,
    this.state_id,
    this.user_id,
    this.country_id,
    this.is_archive,
    this.created_at,
    this.updated_at,
    this.zip_code,
    this.is_default,
    this.first_name,
    this.last_name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'phone': phone ?? '',
      'type': type ?? '',
      'client_id': client_id,
      'address': address,
      'area_id': area_id,
      'state_id': state_id,
      'country_id': country_id,
      'is_archive': is_archive,
      'created_at': created_at,
      'updated_at': updated_at ?? '',
      'zip_code': zip_code ?? '',
      'user_id': user_id ?? '',
      'is_default': is_default ?? '',
      'first_name': first_name ?? '',
      'last_name': last_name ?? '',
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] : null,
      name: map['name'] != null ? map['name'] : null,
      phone: map['phone'],
      type: map['type'],
      client_id: map['client_id'].toString(),
      address: map['address'],
      area_id: map['area_id'],
      state_id: map['state_id'],
      country_id: map['country_id'],
      is_archive: map['is_archive'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      zip_code: map['zip_code'],
      is_default: map['is_default'],
      first_name: map['first_name'],
      last_name: map['last_name'],
    );
  }
}
