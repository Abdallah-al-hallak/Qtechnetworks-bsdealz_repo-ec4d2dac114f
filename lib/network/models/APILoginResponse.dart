import 'package:bsdealz/network/models/APIUser.dart';

/// token : "14|4vxExKtkqDFsD95U5bHtd6onB4VR4afUrLA0p1Wn"
/// user : {"id":3,"email":"majdsafirat@gmail.com","phone":"0789666494","first_name":null,"last_name":null,"gender":null,"dob":null,"street":null,"city":null,"level_id":1,"created_at":"2022-10-03T16:39:38.000000Z","updated_at":"2022-10-03T16:39:38.000000Z"}

class ApiLoginResponse {
  ApiLoginResponse({
      String? token, 
      ApiUser? user,}){
    _token = token;
    _user = user;
}

  ApiLoginResponse.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? ApiUser.fromJson(json['user']) : null;
  }
  String? _token;
  ApiUser? _user;
ApiLoginResponse copyWith({  String? token,
  ApiUser? user,
}) => ApiLoginResponse(  token: token ?? _token,
  user: user ?? _user,
);
  String? get token => _token;
  ApiUser? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}
