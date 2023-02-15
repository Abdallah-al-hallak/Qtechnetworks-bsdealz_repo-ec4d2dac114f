/// id : 1
/// code : "111"
/// discount_value : 10
/// quantity : 74
/// status : "active"
/// created_at : "2022-12-13T12:35:10.000000Z"
/// updated_at : "2022-12-13T22:35:10.000000Z"

class ApiPromoCode {
  ApiPromoCode({
      int? id, 
      String? code, 
      int? discountValue, 
      int? quantity, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _code = code;
    _discountValue = discountValue;
    _quantity = quantity;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ApiPromoCode.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _discountValue = json['discount_value'];
    _quantity = json['quantity'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _code;
  int? _discountValue;
  int? _quantity;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
ApiPromoCode copyWith({  int? id,
  String? code,
  int? discountValue,
  int? quantity,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => ApiPromoCode(  id: id ?? _id,
  code: code ?? _code,
  discountValue: discountValue ?? _discountValue,
  quantity: quantity ?? _quantity,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get code => _code;
  int? get discountValue => _discountValue;
  int? get quantity => _quantity;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['discount_value'] = _discountValue;
    map['quantity'] = _quantity;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}