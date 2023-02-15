/// product_id : 1
/// product_name : "عربي منتج "
/// product_image : "images/rangerover.png"
/// product_description : "وصف منتج عربي"
/// product_name_ref_id : 3
/// product_description_ref_id : 4
/// created_at : "2022-09-29T09:23:17.000000Z"
/// updated_at : "2022-09-29T09:23:17.000000Z"

class ApiProduct {
  ApiProduct({
      int? productId, 
      String? productName, 
      String? productImage, 
      String? productDescription, 
      int? productNameRefId, 
      int? productDescriptionRefId, 
      String? createdAt, 
      String? updatedAt,}){
    _productId = productId;
    _productName = productName;
    _productImage = productImage;
    _productDescription = productDescription;
    _productNameRefId = productNameRefId;
    _productDescriptionRefId = productDescriptionRefId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ApiProduct.fromJson(dynamic json) {
    _productId = json['product_id'];
    _productName = json['product_name'];
    _productImage = json['product_image'];
    _productDescription = json['product_description'];
    _productNameRefId = json['product_name_ref_id'];
    _productDescriptionRefId = json['product_description_ref_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _productId;
  String? _productName;
  String? _productImage;
  String? _productDescription;
  int? _productNameRefId;
  int? _productDescriptionRefId;
  String? _createdAt;
  String? _updatedAt;
ApiProduct copyWith({  int? productId,
  String? productName,
  String? productImage,
  String? productDescription,
  int? productNameRefId,
  int? productDescriptionRefId,
  String? createdAt,
  String? updatedAt,
}) => ApiProduct(  productId: productId ?? _productId,
  productName: productName ?? _productName,
  productImage: productImage ?? _productImage,
  productDescription: productDescription ?? _productDescription,
  productNameRefId: productNameRefId ?? _productNameRefId,
  productDescriptionRefId: productDescriptionRefId ?? _productDescriptionRefId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get productId => _productId;
  String? get productName => _productName;
  String? get productImage => _productImage;
  String? get productDescription => _productDescription;
  int? get productNameRefId => _productNameRefId;
  int? get productDescriptionRefId => _productDescriptionRefId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['product_name'] = _productName;
    map['product_image'] = _productImage;
    map['product_description'] = _productDescription;
    map['product_name_ref_id'] = _productNameRefId;
    map['product_description_ref_id'] = _productDescriptionRefId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}