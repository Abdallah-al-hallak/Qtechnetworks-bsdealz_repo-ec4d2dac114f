/// id : 1
/// address : "wasfi altal street"
/// city : "Amman"
/// state : "amman"
/// street : "wasfi altal street"
/// building : "biulding 81"
/// created_at : "2022-10-16T12:07:26.000000Z"
/// updated_at : null
/// user_id : 3

class ApiAddress {
  ApiAddress({
      int? id, 
      String? address, 
      String? country,
      String? city,
      String? state,
      String? street, 
      String? building, 
      String? apartmentNumber,
      String? createdAt,
      dynamic updatedAt, 
      int? userId,}){
    _id = id;
    _address = address;
    _country = country;
    _city = city;
    _state = state;
    _street = street;
    _building = building;
    _apartmentNumber = apartmentNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
}

  ApiAddress.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _country = json['country'];
    _city = json['city'];
    _state = json['state'];
    _street = json['street'];
    _building = json['building'];
    _apartmentNumber= json['apartment_number'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
  }
  int? _id;
  String? _address;
  String? _country;
  String? _city;
  String? _state;
  String? _street;
  String? _building;
  String? _apartmentNumber;
  String? _createdAt;
  dynamic _updatedAt;
  int? _userId;
ApiAddress copyWith({  int? id,
  String? address,
  String? country,
  String? city,
  String? state,
  String? street,
  String? building,
  String? apartmentNumber,
  String? createdAt,
  dynamic updatedAt,
  int? userId,
}) => ApiAddress(  id: id ?? _id,
  address: address ?? _address,
  country: country ?? _country,
  city: city ?? _city,
  state: state ?? _state,
  street: street ?? _street,
  building: building ?? _building,
  apartmentNumber: apartmentNumber ?? _apartmentNumber,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
);
  int? get id => _id;
  String? get address => _address;
  String? get country => _country;
  String? get city => _city;
  String? get state => _state;

  set state(String? value) {
    _state = value;
  }

  String? get street => _street;
  String? get building => _building;
  String? get apartmentNumber => _apartmentNumber;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['country'] = _country;
    map['city'] = _city;
    map['state'] = _state;
    map['street'] = _street;
    map['building'] = _building;
    map['apartmentNumber'] = _apartmentNumber;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    return map;
  }

}