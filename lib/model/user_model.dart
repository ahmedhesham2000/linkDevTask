import 'dart:convert';

import 'package:test/core/utils/helpers/hive_helper.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? gender;
  int? cityId;
  String? cityName;
  bool? firstLogin;
  String? token;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.gender,
    this.cityId,
    this.cityName,
    this.firstLogin,
    this.token,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    String? gender,
    int? cityId,
    String? cityName,
    bool? firstLogin,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      firstLogin: firstLogin ?? this.firstLogin,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (avatar != null) {
      result.addAll({'avatar': avatar});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (cityId != null) {
      result.addAll({'cityId': cityId});
    }
    if (cityName != null) {
      result.addAll({'cityName': cityName});
    }
    if (firstLogin != null) {
      result.addAll({'firstLogin': firstLogin});
    }
    if (token != null) {
      result.addAll({'token': token});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt(),
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      avatar: map['avatar'],
      gender: map['gender'],
      cityId: map['city_id']?.toInt(),
      cityName: map['city_name'],
      firstLogin: map['first_login'],
      token: map['token'] ?? HiveHelper.getUserToken,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, gender: $gender, cityId: $cityId, cityName: $cityName, firstLogin: $firstLogin, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.avatar == avatar &&
        other.gender == gender &&
        other.cityId == cityId &&
        other.cityName == cityName &&
        other.firstLogin == firstLogin &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        avatar.hashCode ^
        gender.hashCode ^
        cityId.hashCode ^
        cityName.hashCode ^
        firstLogin.hashCode ^
        token.hashCode;
  }
}
