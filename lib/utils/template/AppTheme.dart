/// id : 1
/// type : "color"
/// name : "main Color"
/// active : true
/// with_img : true
/// tag : "buttons"
/// description : "for all buttons and active icons"
/// color : 123
/// font_size : 12

class AppTheme {
  AppTheme({
      int? id, 
      String? type, 
      String? name, 
      bool? active, 
      bool? withImg, 
      String? tag, 
      String? description, 
      int? color, 
      int? fontSize,}){
    _id = id;
    _type = type;
    _name = name;
    _active = active;
    _withImg = withImg;
    _tag = tag;
    _description = description;
    _color = color;
    _fontSize = fontSize;
}

  AppTheme.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _name = json['name'];
    _active = json['active'];
    _withImg = json['with_img'];
    _tag = json['tag'];
    _description = json['description'];
    _color = json['color'];
    _fontSize = json['font_size'];
  }
  int? _id;
  String? _type;
  String? _name;
  bool? _active;
  bool? _withImg;
  String? _tag;
  String? _description;
  int? _color;
  int? _fontSize;
AppTheme copyWith({  int? id,
  String? type,
  String? name,
  bool? active,
  bool? withImg,
  String? tag,
  String? description,
  int? color,
  int? fontSize,
}) => AppTheme(  id: id ?? _id,
  type: type ?? _type,
  name: name ?? _name,
  active: active ?? _active,
  withImg: withImg ?? _withImg,
  tag: tag ?? _tag,
  description: description ?? _description,
  color: color ?? _color,
  fontSize: fontSize ?? _fontSize,
);
  int? get id => _id;
  String? get type => _type;
  String? get name => _name;
  bool? get active => _active;
  bool? get withImg => _withImg;
  String? get tag => _tag;
  String? get description => _description;
  int? get color => _color;
  int? get fontSize => _fontSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['name'] = _name;
    map['active'] = _active;
    map['with_img'] = _withImg;
    map['tag'] = _tag;
    map['description'] = _description;
    map['color'] = _color;
    map['font_size'] = _fontSize;
    return map;
  }

}


// class AppTranslation {
//   static List<Map<String,Object>> defaultTranslation=[
//     {"id":1,"active":true,"language_code":"AR","key":"select_preferred_language","value":"Select preferred language"},
//     {"id":1,"active":true,"language_code":"AR","key":"home_page","value":"الصفحة الرئيسية"}
//   ];
//
//   static String getByKey(String key){
//     for(int i=0;i<defaultTranslation.length;i++){
//       if(defaultTranslation.elementAt(i)["key"].toString()==key){
//         return defaultTranslation.elementAt(i)["value"].toString();
//       }
//     }
//     return "";
//
//
//   }
// }
//
// class TranslationOptions {
//   int id=-1;
//   bool active=true;
//   String language_code="";
//   String key="";
//   String value="";
// }
//
//
//
//
//
//
// class AppTheme {
//   static const  String COLOR_TYPE="color";
//   static const String BUTTON_TYPE="button";
//   static const String SIZE_TYPE="size";
//   static const String EDIT_TEXT_TYPE="edit_text";
//   static const String TEXT_TYPE="text";
//   static Map<String,Object> defaultTheme={
//     "main_color": {"id":1,"type":"color","name":"main Color","active":true,"with_img":true,"tag":"buttons","description":"for all buttons and active icons","color":0XFF174785,"font_size":12},
//   };
//
// }
// class ThemeOptions {
//   int id=-1;
//   bool active=true;
//   bool with_img=true;
//   String tag="";
//   String name="";
//   String description="";
//   int color=0XFF174785;
//   int font_size=12;
// }