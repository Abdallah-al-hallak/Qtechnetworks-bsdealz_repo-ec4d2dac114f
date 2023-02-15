import 'package:bsdealz/network/models/APICampaign.dart';


/// id : 1
/// sort : "1"
/// title : "بانر عربي"
/// sub_title : "وصف  بانر عربي"
/// title_ref_id : 5
/// sub_title_ref_id : 6
/// page : "1"
/// campaign_id : 1
/// image : "images/rangeroverlat.jpg"
/// created_at : "2022-10-04T04:00:00.000000Z"
/// updated_at : null
/// status : "active"
/// campaign : {"id":1,"name":"حملة عربي","image":null,"description":"حملة عربي","name_ref_id":1,"description_ref_id":2,"price":"817","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":111,"sold":11,"prize":"Dolor tempora offici","draw_date":"2010-06-16","start_date":"1996-08-09","end_date":"1985-12-04","product_id":1,"created_at":"2022-09-29T09:23:37.000000Z","updated_at":"2022-09-29T09:23:37.000000Z","countdown_date":null,"countdown_quantity":100,"status":"closed","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false}

class ApiBanner {
  ApiBanner({
      int? id, 
      String? sort, 
      String? title, 
      String? subTitle, 
      int? titleRefId, 
      int? subTitleRefId, 
      String? page, 
      int? campaignId, 
      String? image, 
      String? createdAt, 
      dynamic updatedAt, 
      String? status, 
      ApiCampaign? campaign,}){
    _id = id;
    _sort = sort;
    _title = title;
    _subTitle = subTitle;
    _titleRefId = titleRefId;
    _subTitleRefId = subTitleRefId;
    _page = page;
    _campaignId = campaignId;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _status = status;
    _campaign = campaign;
}

  ApiBanner.fromJson(dynamic json) {
    _id = json['id'];
    _sort = json['sort'];
    _title = json['title'];
    _subTitle = json['sub_title'];
    _titleRefId = json['title_ref_id'];
    _subTitleRefId = json['sub_title_ref_id'];
    _page = json['page'];
    _campaignId = json['campaign_id'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
    _campaign = json['campaign'] != null ? ApiCampaign.fromJson(json['campaign']) : null;
  }
  int? _id;
  String? _sort;
  String? _title;
  String? _subTitle;
  int? _titleRefId;
  int? _subTitleRefId;
  String? _page;
  int? _campaignId;
  String? _image;
  String? _createdAt;
  dynamic _updatedAt;
  String? _status;
  ApiCampaign? _campaign;
ApiBanner copyWith({  int? id,
  String? sort,
  String? title,
  String? subTitle,
  int? titleRefId,
  int? subTitleRefId,
  String? page,
  int? campaignId,
  String? image,
  String? createdAt,
  dynamic updatedAt,
  String? status,
  ApiCampaign? campaign,
}) => ApiBanner(  id: id ?? _id,
  sort: sort ?? _sort,
  title: title ?? _title,
  subTitle: subTitle ?? _subTitle,
  titleRefId: titleRefId ?? _titleRefId,
  subTitleRefId: subTitleRefId ?? _subTitleRefId,
  page: page ?? _page,
  campaignId: campaignId ?? _campaignId,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  status: status ?? _status,
  campaign: campaign ?? _campaign,
);
  int? get id => _id;
  String? get sort => _sort;
  String? get title => _title;
  String? get subTitle => _subTitle;
  int? get titleRefId => _titleRefId;
  int? get subTitleRefId => _subTitleRefId;
  String? get page => _page;
  int? get campaignId => _campaignId;
  String? get image => _image;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  String? get status => _status;
  ApiCampaign? get campaign => _campaign;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sort'] = _sort;
    map['title'] = _title;
    map['sub_title'] = _subTitle;
    map['title_ref_id'] = _titleRefId;
    map['sub_title_ref_id'] = _subTitleRefId;
    map['page'] = _page;
    map['campaign_id'] = _campaignId;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['status'] = _status;
    if (_campaign != null) {
      map['campaign'] = _campaign?.toJson();
    }
    return map;
  }

}
