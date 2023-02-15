import 'package:bsdealz/network/models/APIImage.dart';
import 'package:bsdealz/network/models/APIProduct.dart';

/// id : 22
/// name : "Sybil Dean"
/// image : "images/rangerover.png"
/// description : "Consequatur Sint am"
/// name_ref_id : 0
/// description_ref_id : 0
/// price : "10"
/// donate : 1
/// early : 1
/// early_bird_quantity : 100
/// early_bird_stock : 94
/// quantity : 3000
/// sold : 110
/// prize : "Sit aspernatur excep"
/// draw_date : "2000-10-25"
/// start_date : "2021-12-28"
/// end_date : "2022-10-28"
/// product_id : 1
/// created_at : "2022-10-02T13:26:05.000000Z"
/// updated_at : "2022-10-05T01:42:11.000000Z"
/// countdown_date : "2022-09-07 00:00:00"
/// countdown_quantity : 0
/// status : "active"
/// images : [{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}]
/// products : [{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}]
/// is_countdown : true

class ApiCampaign {
  ApiCampaign({
      int? id, 
      String? name, 
      String? image, 
      String? description, 
      int? nameRefId, 
      int? descriptionRefId, 
      String? price, 
      int? donate, 
      int? early, 
      int? earlyBirdQuantity, 
      int? earlyBirdStock, 
      int? quantity, 
      int? sold, 
      String? prize, 
      String? drawDate, 
      String? startDate, 
      String? endDate, 
      int? productId, 
      String? createdAt, 
      String? updatedAt, 
      String? countdownDate, 
      int? countdownQuantity, 
      String? status, 
      List<ApiImage>? images,
      List<ApiProduct>? products,
      bool? isCountdown,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _nameRefId = nameRefId;
    _descriptionRefId = descriptionRefId;
    _price = price;
    _donate = donate;
    _early = early;
    _earlyBirdQuantity = earlyBirdQuantity;
    _earlyBirdStock = earlyBirdStock;
    _quantity = quantity;
    _sold = sold;
    _prize = prize;
    _drawDate = drawDate;
    _startDate = startDate;
    _endDate = endDate;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _countdownDate = countdownDate;
    _countdownQuantity = countdownQuantity;
    _status = status;
    _images = images;
    _products = products;
    _isCountdown = isCountdown;
}

  ApiCampaign.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _nameRefId = json['name_ref_id'];
    _descriptionRefId = json['description_ref_id'];
    _price = json['price'];
    _donate = json['donate'];
    _early = json['early'];
    _earlyBirdQuantity = json['early_bird_quantity'];
    _earlyBirdStock = json['early_bird_stock'];
    _quantity = json['quantity'];
    _sold = json['sold'];
    _prize = json['prize'];
    _drawDate = json['draw_date'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _countdownDate = json['countdown_date'];
    _countdownQuantity = json['countdown_quantity'];
    _status = json['status'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(ApiImage.fromJson(v));
      });
    }
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ApiProduct.fromJson(v));
      });
    }
    _isCountdown = json['is_countdown'];
  }
  int? _id;
  String? _name;
  String? _image;
  String? _description;
  int? _nameRefId;
  int? _descriptionRefId;
  String? _price;
  int? _donate;
  int? _early;
  int? _earlyBirdQuantity;
  int? _earlyBirdStock;
  int? _quantity;
  int? _sold;
  String? _prize;
  String? _drawDate;
  String? _startDate;
  String? _endDate;
  int? _productId;
  String? _createdAt;
  String? _updatedAt;
  String? _countdownDate;
  int? _countdownQuantity;
  String? _status;
  List<ApiImage>? _images;
  List<ApiProduct>? _products;
  bool? _isCountdown;
ApiCampaign copyWith({  int? id,
  String? name,
  String? image,
  String? description,
  int? nameRefId,
  int? descriptionRefId,
  String? price,
  int? donate,
  int? early,
  int? earlyBirdQuantity,
  int? earlyBirdStock,
  int? quantity,
  int? sold,
  String? prize,
  String? drawDate,
  String? startDate,
  String? endDate,
  int? productId,
  String? createdAt,
  String? updatedAt,
  String? countdownDate,
  int? countdownQuantity,
  String? status,
  List<ApiImage>? images,
  List<ApiProduct>? products,
  bool? isCountdown,
}) => ApiCampaign(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  nameRefId: nameRefId ?? _nameRefId,
  descriptionRefId: descriptionRefId ?? _descriptionRefId,
  price: price ?? _price,
  donate: donate ?? _donate,
  early: early ?? _early,
  earlyBirdQuantity: earlyBirdQuantity ?? _earlyBirdQuantity,
  earlyBirdStock: earlyBirdStock ?? _earlyBirdStock,
  quantity: quantity ?? _quantity,
  sold: sold ?? _sold,
  prize: prize ?? _prize,
  drawDate: drawDate ?? _drawDate,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  productId: productId ?? _productId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  countdownDate: countdownDate ?? _countdownDate,
  countdownQuantity: countdownQuantity ?? _countdownQuantity,
  status: status ?? _status,
  images: images ?? _images,
  products: products ?? _products,
  isCountdown: isCountdown ?? _isCountdown,
);
  int? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  int? get nameRefId => _nameRefId;
  int? get descriptionRefId => _descriptionRefId;
  String? get price => _price;
  int? get donate => _donate;
  int? get early => _early;
  int? get earlyBirdQuantity => _earlyBirdQuantity;
  int? get earlyBirdStock => _earlyBirdStock;
  int? get quantity => _quantity;
  int? get sold => _sold;
  String? get prize => _prize;
  String? get drawDate => _drawDate;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  int? get productId => _productId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get countdownDate => _countdownDate;
  int? get countdownQuantity => _countdownQuantity;
  String? get status => _status;
  List<ApiImage>? get images => _images;
  List<ApiProduct>? get products => _products;
  bool? get isCountdown => _isCountdown;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['name_ref_id'] = _nameRefId;
    map['description_ref_id'] = _descriptionRefId;
    map['price'] = _price;
    map['donate'] = _donate;
    map['early'] = _early;
    map['early_bird_quantity'] = _earlyBirdQuantity;
    map['early_bird_stock'] = _earlyBirdStock;
    map['quantity'] = _quantity;
    map['sold'] = _sold;
    map['prize'] = _prize;
    map['draw_date'] = _drawDate;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['countdown_date'] = _countdownDate;
    map['countdown_quantity'] = _countdownQuantity;
    map['status'] = _status;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['is_countdown'] = _isCountdown;
    return map;
  }

}
