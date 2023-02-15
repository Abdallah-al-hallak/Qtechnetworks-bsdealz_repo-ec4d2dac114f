/// id : 1
/// user_id : 3
/// last_digits : 1234
/// card_type : "VISA"
/// token : "token is herkfksmflfka "
/// status : "active"
/// created_at : "2022-10-08T14:24:33.000000Z"
/// updated_at : null

class ApiCreditCard {
  ApiCreditCard({
      int? id, 
      int? userId, 
      int? lastDigits, 
      String? cardType, 
      String? token, 
      String? status, 
      String? createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _userId = userId;
    _lastDigits = lastDigits;
    _cardType = cardType;
    _token = token;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ApiCreditCard.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _lastDigits = json['last_digits'];
    _cardType = json['card_type'];
    _token = json['token'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  int? _lastDigits;
  String? _cardType;
  String? _token;
  String? _status;
  String? _createdAt;
  dynamic _updatedAt;
ApiCreditCard copyWith({  int? id,
  int? userId,
  int? lastDigits,
  String? cardType,
  String? token,
  String? status,
  String? createdAt,
  dynamic updatedAt,
}) => ApiCreditCard(  id: id ?? _id,
  userId: userId ?? _userId,
  lastDigits: lastDigits ?? _lastDigits,
  cardType: cardType ?? _cardType,
  token: token ?? _token,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get userId => _userId;
  int? get lastDigits => _lastDigits;
  String? get cardType => _cardType;
  String? get token => _token;
  String? get status => _status;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['last_digits'] = _lastDigits;
    map['card_type'] = _cardType;
    map['token'] = _token;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}