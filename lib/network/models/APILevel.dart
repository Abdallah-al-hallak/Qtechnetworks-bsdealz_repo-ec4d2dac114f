/// id : 1
/// name : "المرحلة الزرقاء"
/// benefits : "استرجاع 1.5 % من مشترياتك"
/// name_ref_id : 25
/// benefits_ref_id : 26
/// start_threshold : "0.00"
/// end_threshold : "2500.00"
/// discount_value : "1.50"
/// start_color : "0XFF29A5FF"
/// end_color : "0XFF01477B"
/// side_color_start : ""
/// side_color_end : ""
/// side_font_color : ""
/// content_font_color : ""
/// center_box_color : ""
/// created_at : null
/// updated_at : "2022-09-26T22:51:13.000000Z"

class ApiLevel {
  ApiLevel({
    int? id,
    String? name,
    String? benefits,
    int? nameRefId,
    int? benefitsRefId,
    String? startThreshold,
    String? endThreshold,
    String? discountValue,
    String? startColor,
    String? endColor,
    String? sideColorStart,
    String? sideColorEnd,
    String? sideFontColor,
    String? contentFontColor,
    String? centerBoxColor,
    dynamic createdAt,
    String? updatedAt,}){
    _id = id;
    _name = name;
    _benefits = benefits;
    _nameRefId = nameRefId;
    _benefitsRefId = benefitsRefId;
    _startThreshold = startThreshold;
    _endThreshold = endThreshold;
    _discountValue = discountValue;
    _startColor = startColor;
    _endColor = endColor;
    _sideColorStart = sideColorStart;
    _sideColorEnd = sideColorEnd;
    _sideFontColor = sideFontColor;
    _contentFontColor = contentFontColor;
    _centerBoxColor = centerBoxColor;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ApiLevel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _benefits = json['benefits'];
    _nameRefId = json['name_ref_id'];
    _benefitsRefId = json['benefits_ref_id'];
    _startThreshold = json['start_threshold'];
    _endThreshold = json['end_threshold'];
    _discountValue = json['discount_value'];
    _startColor = json['start_color'];
    _endColor = json['end_color'];
    _sideColorStart = json['side_color_start'];
    _sideColorEnd = json['side_color_end'];
    _sideFontColor = json['side_font_color'];
    _contentFontColor = json['content_font_color'];
    _centerBoxColor = json['center_box_color'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _benefits;
  int? _nameRefId;
  int? _benefitsRefId;
  String? _startThreshold;
  String? _endThreshold;
  String? _discountValue;
  String? _startColor;
  String? _endColor;
  String? _sideColorStart;
  String? _sideColorEnd;
  String? _sideFontColor;
  String? _contentFontColor;
  String? _centerBoxColor;
  dynamic _createdAt;
  String? _updatedAt;
  ApiLevel copyWith({  int? id,
    String? name,
    String? benefits,
    int? nameRefId,
    int? benefitsRefId,
    String? startThreshold,
    String? endThreshold,
    String? discountValue,
    String? startColor,
    String? endColor,
    String? sideColorStart,
    String? sideColorEnd,
    String? sideFontColor,
    String? contentFontColor,
    String? centerBoxColor,
    dynamic createdAt,
    String? updatedAt,
  }) => ApiLevel(  id: id ?? _id,
    name: name ?? _name,
    benefits: benefits ?? _benefits,
    nameRefId: nameRefId ?? _nameRefId,
    benefitsRefId: benefitsRefId ?? _benefitsRefId,
    startThreshold: startThreshold ?? _startThreshold,
    endThreshold: endThreshold ?? _endThreshold,
    discountValue: discountValue ?? _discountValue,
    startColor: startColor ?? _startColor,
    endColor: endColor ?? _endColor,
    sideColorStart: sideColorStart ?? _sideColorStart,
    sideColorEnd: sideColorEnd ?? _sideColorEnd,
    sideFontColor: sideFontColor ?? _sideFontColor,
    contentFontColor: contentFontColor ?? _contentFontColor,
    centerBoxColor: centerBoxColor ?? _centerBoxColor,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  int? get id => _id;
  String? get name => _name;
  String? get benefits => _benefits;
  int? get nameRefId => _nameRefId;
  int? get benefitsRefId => _benefitsRefId;
  String? get startThreshold => _startThreshold;
  String? get endThreshold => _endThreshold;
  String? get discountValue => _discountValue;
  String? get startColor => _startColor;
  String? get endColor => _endColor;
  String? get sideColorStart => _sideColorStart;
  String? get sideColorEnd => _sideColorEnd;
  String? get sideFontColor => _sideFontColor;
  String? get contentFontColor => _contentFontColor;
  String? get centerBoxColor => _centerBoxColor;
  dynamic get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['benefits'] = _benefits;
    map['name_ref_id'] = _nameRefId;
    map['benefits_ref_id'] = _benefitsRefId;
    map['start_threshold'] = _startThreshold;
    map['end_threshold'] = _endThreshold;
    map['discount_value'] = _discountValue;
    map['start_color'] = _startColor;
    map['end_color'] = _endColor;
    map['side_color_start'] = _sideColorStart;
    map['side_color_end'] = _sideColorEnd;
    map['side_font_color'] = _sideFontColor;
    map['content_font_color'] = _contentFontColor;
    map['center_box_color'] = _centerBoxColor;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}