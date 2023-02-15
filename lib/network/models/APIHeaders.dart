/// token : "token"
/// Accept-Language : "en"
/// Accept-Currency : "AED"

class ApiHeaders {
  ApiHeaders({
      String? token, 
      String? acceptLanguage, 
      String? acceptCurrency,}){
    _token = token;
    _acceptLanguage = acceptLanguage;
    _acceptCurrency = acceptCurrency;
}

  ApiHeaders.fromJson(dynamic json) {
    _token = json['token'];
    _acceptLanguage = json['Accept-Language'];
    _acceptCurrency = json['Accept-Currency'];
  }
  String? _token;


  String? _acceptLanguage;
  String? _acceptCurrency;
ApiHeaders copyWith({  String? token,
  String? acceptLanguage,
  String? acceptCurrency,
}) => ApiHeaders(  token: token ?? _token,
  acceptLanguage: acceptLanguage ?? _acceptLanguage,
  acceptCurrency: acceptCurrency ?? _acceptCurrency,
);
  String? get token => _token;
  String? get acceptLanguage => _acceptLanguage;
  String? get acceptCurrency => _acceptCurrency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['Accept-Language'] = _acceptLanguage;
    map['Accept-Currency'] = _acceptCurrency;
    return map;
  }
  set token(String? value) {
    _token = value;
  }

  set acceptLanguage(String? value) {
    _acceptLanguage = value;
  }

  set acceptCurrency(String? value) {
    _acceptCurrency = value;
  }
}