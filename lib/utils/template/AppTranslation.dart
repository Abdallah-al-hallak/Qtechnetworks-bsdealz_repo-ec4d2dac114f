/// id : 1
/// active : true
/// language_code : "AR"
/// key : "home_page"
/// value : "الصفحة الرئيسية"

class AppTranslation {
  AppTranslation({
      int? id, 
      bool? active, 
      String? languageCode, 
      String? key, 
      String? value,}){
    _id = id;
    _active = active;
    _languageCode = languageCode;
    _key = key;
    _value = value;
}

  AppTranslation.fromJson(dynamic json) {
    _id = json['id'];
    _active = json['active'];
    _languageCode = json['language_code'];
    _key = json['key'];
    _value = json['value'];
  }
  int? _id;
  bool? _active;
  String? _languageCode;
  String? _key;
  String? _value;
AppTranslation copyWith({  int? id,
  bool? active,
  String? languageCode,
  String? key,
  String? value,
}) => AppTranslation(  id: id ?? _id,
  active: active ?? _active,
  languageCode: languageCode ?? _languageCode,
  key: key ?? _key,
  value: value ?? _value,
);
  int? get id => _id;
  bool? get active => _active;
  String? get languageCode => _languageCode;
  String? get key => _key;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['active'] = _active;
    map['language_code'] = _languageCode;
    map['key'] = _key;
    map['value'] = _value;
    return map;
  }

}