/// id : 1
/// name : "is_video_into"
/// value : "true"
/// type : "app_options"
/// template : null
/// status : "active"
/// created_at : "2022-10-08T13:02:03.000000Z"
/// updated_at : null

class ApiSetting {
  ApiSetting({
      int? id, 
      String? name, 
      String? svalue,
      String? type, 
      dynamic template, 
      String? status, 
      String? createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _name = name;
    _svalue = svalue;
    _type = type;
    _template = template;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ApiSetting.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _svalue = json['value'];
    _type = json['type'];
    _template = json['template'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _svalue;
  String? _type;
  dynamic _template;
  String? _status;
  String? _createdAt;
  dynamic _updatedAt;
ApiSetting copyWith({  int? id,
  String? name,
  String? svalue,
  String? type,
  dynamic template,
  String? status,
  String? createdAt,
  dynamic updatedAt,
}) => ApiSetting(  id: id ?? _id,
  name: name ?? _name,
  svalue: svalue ?? _svalue,
  type: type ?? _type,
  template: template ?? _template,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get svalue => _svalue;
  String? get type => _type;
  dynamic get template => _template;
  String? get status => _status;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['value'] = _svalue;
    map['type'] = _type;
    map['template'] = _template;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}