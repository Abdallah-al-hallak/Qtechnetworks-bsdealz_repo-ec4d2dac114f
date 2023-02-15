// To parse this JSON data, do
//
//     final otp = otpFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OTP otpFromJson(String str) => OTP.fromJson(json.decode(str));

String otpToJson(OTP data) => json.encode(data.toJson());

class OTP {
  OTP({
    required this.phone,
    required this.code,
    required this.msg,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String phone;
  int code;
  String msg;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory OTP.fromJson(Map<String, dynamic> json) => OTP(
    phone: json["PHONE"] == null ? null : json["PHONE"],
    code: json["CODE"] == null ? null : json["CODE"],
    msg: json["MSG"] == null ? null : json["MSG"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    id: json["ID"] == null ? null : json["ID"],
  );

  Map<String, dynamic> toJson() => {
    "PHONE": phone == null ? null : phone,
    "CODE": code == null ? null : code,
    "MSG": msg == null ? null : msg,
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "ID": id == null ? null : id,
  };
}
