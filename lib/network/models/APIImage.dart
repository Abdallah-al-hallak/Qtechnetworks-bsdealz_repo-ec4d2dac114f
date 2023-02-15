/// id : 18
/// name : "campaing_image"
/// image_path : "images/1664731565513210.jpg"
/// campaing : "22"
/// created_at : "2022-10-02T13:26:05.000000Z"
/// updated_at : "2022-10-02T13:26:05.000000Z"

class ApiImage {
  ApiImage({
      int? id, 
      String? name, 
      String? imagePath, 
      String? campaing, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _imagePath = imagePath;
    _campaing = campaing;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ApiImage.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imagePath = json['image_path'];
    _campaing = json['campaing'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _imagePath;
  String? _campaing;
  String? _createdAt;
  String? _updatedAt;
ApiImage copyWith({  int? id,
  String? name,
  String? imagePath,
  String? campaing,
  String? createdAt,
  String? updatedAt,
}) => ApiImage(  id: id ?? _id,
  name: name ?? _name,
  imagePath: imagePath ?? _imagePath,
  campaing: campaing ?? _campaing,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get imagePath => _imagePath;
  String? get campaing => _campaing;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image_path'] = _imagePath;
    map['campaing'] = _campaing;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}