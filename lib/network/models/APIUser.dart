/// id : 14
/// email : "anas@qtechnetworks.com"
/// phone : "+962788261243"
/// first_name : "anas"
/// last_name : "alfasfous"
/// gender : null
/// dob : null
/// street : null
/// building : ""
/// city : null
/// state : ""
/// level_id : 1
/// points : 1000
/// total_collected_points : 2000
/// language : null
/// currency : null
/// fcm_token : "ehU_UWbIQr2gfj8PbZuo2e:APA91bHH2ep8GapWC-Fp7wnoEQvz_vKiUwCX0IS0i78S2lg2LPYlbviMC5Nyk6opwCn4CF2o_guZxVNakt0_K6i3QxxWrOVlng_GVhdb8hScxfAybuKFPyfQEeEDYG981Pu2xl2GL81B"
/// created_at : "2022-10-16T23:25:26.000000Z"
/// updated_at : "2022-10-20T16:03:41.000000Z"

class ApiUser {
  ApiUser({
    int? id,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    dynamic gender,
    dynamic dob,
    dynamic street,
    String? building,
    dynamic city,
    String? state,
    int? levelId,
    dynamic? points,
    dynamic? totalCollectedPoints,
    dynamic language,
    dynamic currency,
    String? fcmToken,
    String? pointsValidationDate,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _email = email;
    _phone = phone;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dob = dob;
    _street = street;
    _building = building;
    _city = city;
    _state = state;
    _levelId = levelId;
    _points = points;
    _totalCollectedPoints = totalCollectedPoints;
    _language = language;
    _currency = currency;
    _fcmToken = fcmToken;
    _pointsValidationDate = pointsValidationDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ApiUser.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _phone = json['phone'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _dob = json['dob'];
    _street = json['street'];
    _building = json['building'];
    _city = json['city'];
    _state = json['state'];
    _levelId = json['level_id'];
    _points = json['points'];
    _totalCollectedPoints = json['total_collected_points'];
    _language = json['language'];
    _currency = json['currency'];
    _fcmToken = json['fcm_token'];
    _pointsValidationDate = json['points_validation_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _email;
  String? _phone;
  String? _firstName;
  String? _lastName;
  dynamic _gender;
  dynamic _dob;
  dynamic _street;
  String? _building;
  dynamic _city;
  String? _state;
  int? _levelId;
  dynamic? _points;
  dynamic? _totalCollectedPoints;
  dynamic _language;
  dynamic _currency;
  String? _fcmToken;
  String? _pointsValidationDate;
  String? _createdAt;
  String? _updatedAt;
  ApiUser copyWith({  int? id,
    String? email,
    String? phone,
    String? firstName,
    String? lastName,
    dynamic gender,
    dynamic dob,
    dynamic street,
    String? building,
    dynamic city,
    String? state,
    int? levelId,
    dynamic? points,
    dynamic? totalCollectedPoints,
    dynamic language,
    dynamic currency,
    String? fcmToken,
    String? pointsValidationDate,
    String? createdAt,
    String? updatedAt,
  }) => ApiUser(  id: id ?? _id,
    email: email ?? _email,
    phone: phone ?? _phone,
    firstName: firstName ?? _firstName,
    lastName: lastName ?? _lastName,
    gender: gender ?? _gender,
    dob: dob ?? _dob,
    street: street ?? _street,
    building: building ?? _building,
    city: city ?? _city,
    state: state ?? _state,
    levelId: levelId ?? _levelId,
    points: points ?? _points,
    totalCollectedPoints: totalCollectedPoints ?? _totalCollectedPoints,
    language: language ?? _language,
    currency: currency ?? _currency,
    fcmToken: fcmToken ?? _fcmToken,
    pointsValidationDate: pointsValidationDate ?? _pointsValidationDate,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  int? get id => _id;
  String? get email => _email;
  String? get phone => _phone;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  dynamic get gender => _gender;
  dynamic get dob => _dob;
  dynamic get street => _street;
  String? get building => _building;
  dynamic get city => _city;
  String? get state => _state;
  int? get levelId => _levelId;
  dynamic? get points => _points;
  dynamic? get totalCollectedPoints => _totalCollectedPoints;
  dynamic get language => _language;
  dynamic get currency => _currency;
  String? get fcmToken => _fcmToken;
  String? get pointsValidationDate => _pointsValidationDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['phone'] = _phone;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['street'] = _street;
    map['building'] = _building;
    map['city'] = _city;
    map['state'] = _state;
    map['level_id'] = _levelId;
    map['points'] = _points;
    map['total_collected_points'] = _totalCollectedPoints;
    map['language'] = _language;
    map['currency'] = _currency;
    map['fcm_token'] = _fcmToken;
    map['pointsValidationDate'] = _pointsValidationDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

  set updatedAt(String? value) {
    _updatedAt = value;
  }

  set createdAt(String? value) {
    _createdAt = value;
  }

  set fcmToken(String? value) {
    _fcmToken = value;
  }
  set pointsValidationDate(String? value) {
    _pointsValidationDate = value;
  }

  set currency(dynamic value) {
    _currency = value;
  }

  set language(dynamic value) {
    _language = value;
  }

  set totalCollectedPoints(dynamic? value) {
    _totalCollectedPoints = value;
  }

  set points(dynamic? value) {
    _points = value;
  }

  set levelId(int? value) {
    _levelId = value;
  }

  set state(String? value) {
    _state = value;
  }

  set city(dynamic value) {
    _city = value;
  }

  set building(String? value) {
    _building = value;
  }

  set street(dynamic value) {
    _street = value;
  }

  set dob(dynamic value) {
    _dob = value;
  }

  set gender(dynamic value) {
    _gender = value;
  }

  set lastName(String? value) {
    _lastName = value;
  }

  set firstName(String? value) {
    _firstName = value;
  }

  set phone(String? value) {
    _phone = value;
  }

  set email(String? value) {
    _email = value;
  }

  set id(int? value) {
    _id = value;
  }
}