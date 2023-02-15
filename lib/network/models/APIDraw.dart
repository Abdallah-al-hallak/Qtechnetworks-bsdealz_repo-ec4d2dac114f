import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/network/models/APICoupon.dart';
import 'package:bsdealz/network/models/APIUser.dart';

/// id : 1
/// campaign_id : 22
/// winner_id : 1
/// coupon_id : 1
/// draw_date : "2022-10-10 00:00:00"
/// upcoming_date : "2022-10-07 14:59:45"
/// status : ""
/// winner_name : null
/// winner_address : null
/// stream_url : "http://google.com"
/// created_at : "2022-10-06T09:30:29.000000Z"
/// updated_at : null
/// campaign : {"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}
/// winner : {"id":1,"email":"majdsafira@gmail.com","phone":"0789666494","first_name":null,"last_name":null,"gender":null,"dob":null,"street":null,"city":null,"level_id":1,"created_at":"2022-09-29T07:29:04.000000Z","updated_at":"2022-09-29T07:29:04.000000Z"}
/// coupon : null

class ApiDraw {
  ApiDraw({
      int? id, 
      int? campaignId, 
      int? winnerId, 
      int? couponId, 
      String? drawDate, 
      String? upcomingDate, 
      String? status, 
      dynamic winnerName, 
      dynamic winnerAddress, 
      String? streamUrl, 
      String? createdAt, 
      dynamic updatedAt, 
      ApiCampaign? campaign,
      ApiUser? winner,
    ApiCoupon? coupon,}){
    _id = id;
    _campaignId = campaignId;
    _winnerId = winnerId;
    _couponId = couponId;
    _drawDate = drawDate;
    _upcomingDate = upcomingDate;
    _status = status;
    _winnerName = winnerName;
    _winnerAddress = winnerAddress;
    _streamUrl = streamUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _campaign = campaign;
    _winner = winner;
    _coupon = coupon;
}

  ApiDraw.fromJson(dynamic json) {
    _id = json['id'];
    _campaignId = json['campaign_id'];
    _winnerId = json['winner_id'];
    _couponId = json['coupon_id'];
    _drawDate = json['draw_date'];
    _upcomingDate = json['upcoming_date'];
    _status = json['status'];
    _winnerName = json['winner_name'];
    _winnerAddress = json['winner_address'];
    _streamUrl = json['stream_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _campaign = json['campaign'] != null ? ApiCampaign.fromJson(json['campaign']) : null;
    _winner = json['winner'] != null ? ApiUser.fromJson(json['winner']) : null;
    _coupon = json['coupon']!= null ? ApiCoupon.fromJson(json['coupon']) : null;
  }
  int? _id;
  int? _campaignId;
  int? _winnerId;
  int? _couponId;
  String? _drawDate;
  String? _upcomingDate;
  String? _status;
  dynamic _winnerName;
  dynamic _winnerAddress;
  String? _streamUrl;
  String? _createdAt;
  dynamic _updatedAt;
  ApiCampaign? _campaign;
  ApiUser? _winner;
  ApiCoupon? _coupon;
ApiDraw copyWith({  int? id,
  int? campaignId,
  int? winnerId,
  int? couponId,
  String? drawDate,
  String? upcomingDate,
  String? status,
  dynamic winnerName,
  dynamic winnerAddress,
  String? streamUrl,
  String? createdAt,
  dynamic updatedAt,
  ApiCampaign? campaign,
  ApiUser? winner,
  ApiCoupon? coupon,
}) => ApiDraw(  id: id ?? _id,
  campaignId: campaignId ?? _campaignId,
  winnerId: winnerId ?? _winnerId,
  couponId: couponId ?? _couponId,
  drawDate: drawDate ?? _drawDate,
  upcomingDate: upcomingDate ?? _upcomingDate,
  status: status ?? _status,
  winnerName: winnerName ?? _winnerName,
  winnerAddress: winnerAddress ?? _winnerAddress,
  streamUrl: streamUrl ?? _streamUrl,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  campaign: campaign ?? _campaign,
  winner: winner ?? _winner,
  coupon: coupon ?? _coupon,
);
  int? get id => _id;
  int? get campaignId => _campaignId;
  int? get winnerId => _winnerId;
  int? get couponId => _couponId;
  String? get drawDate => _drawDate;
  String? get upcomingDate => _upcomingDate;
  String? get status => _status;
  dynamic get winnerName => _winnerName;
  dynamic get winnerAddress => _winnerAddress;
  String? get streamUrl => _streamUrl;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  ApiCampaign? get campaign => _campaign;
  ApiUser? get winner => _winner;
  ApiCoupon? get coupon => _coupon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['campaign_id'] = _campaignId;
    map['winner_id'] = _winnerId;
    map['coupon_id'] = _couponId;
    map['draw_date'] = _drawDate;
    map['upcoming_date'] = _upcomingDate;
    map['status'] = _status;
    map['winner_name'] = _winnerName;
    map['winner_address'] = _winnerAddress;
    map['stream_url'] = _streamUrl;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_campaign != null) {
      map['campaign'] = _campaign?.toJson();
    }
    if (_winner != null) {
      map['winner'] = _winner?.toJson();
    }
    if (_coupon != null) {
      map['coupon'] = _coupon?.toJson();
    }
    return map;
  }

}
