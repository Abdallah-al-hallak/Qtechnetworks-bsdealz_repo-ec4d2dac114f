/// id : 1
/// name : "main_button_color"
/// value : "X0FFFFFF"
/// template : "template 1"
/// created_at : "2022-10-08T12:56:39.000000Z"
/// updated_at : null

class ApiTheme {
  ApiTheme({
      int? id, 
      String? name, 
      String? value, 
      String? template, 
      String? createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _name = name;
    _value = value;
    _template = template;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ApiTheme.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _value = json['value'];
    _template = json['template'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _value;
  String? _template;
  String? _createdAt;
  dynamic _updatedAt;
ApiTheme copyWith({  int? id,
  String? name,
  String? value,
  String? template,
  String? createdAt,
  dynamic updatedAt,
}) => ApiTheme(  id: id ?? _id,
  name: name ?? _name,
  value: value ?? _value,
  template: template ?? _template,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get value => _value;
  String? get template => _template;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['value'] = _value;
    map['template'] = _template;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}