import 'package:bsdealz/network/models/APICampaign.dart';

/// id : 1
/// campaign_id : 22
/// user_id : 3
/// created_at : "2022-10-08T12:56:49.000000Z"
/// updated_at : null
/// campaign : {"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}

class ApiWishListItem {
  ApiWishListItem({
      int? id, 
      int? campaignId, 
      int? userId, 
      String? createdAt, 
      dynamic updatedAt, 
      ApiCampaign? campaign,}){
    _id = id;
    _campaignId = campaignId;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _campaign = campaign;
}

  ApiWishListItem.fromJson(dynamic json) {
    _id = json['id'];
    _campaignId = json['campaign_id'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _campaign = json['campaign'] != null ? ApiCampaign.fromJson(json['campaign']) : null;
  }
  int? _id;
  int? _campaignId;
  int? _userId;
  String? _createdAt;
  dynamic _updatedAt;
  ApiCampaign? _campaign;
ApiWishListItem copyWith({  int? id,
  int? campaignId,
  int? userId,
  String? createdAt,
  dynamic updatedAt,
  ApiCampaign? campaign,
}) => ApiWishListItem(  id: id ?? _id,
  campaignId: campaignId ?? _campaignId,
  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  campaign: campaign ?? _campaign,
);
  int? get id => _id;
  int? get campaignId => _campaignId;
  int? get userId => _userId;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  ApiCampaign? get campaign => _campaign;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['campaign_id'] = _campaignId;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_campaign != null) {
      map['campaign'] = _campaign?.toJson();
    }
    return map;
  }

}
