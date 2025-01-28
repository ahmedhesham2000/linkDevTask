import 'dart:convert';

class ProvidersModel {
  final int? id;
  final String? name;
  final String? avatar;
  final String? rateAvg;
  final String? nationality;
  ProvidersModel({
    this.id,
    this.name,
    this.avatar,
    this.rateAvg,
    this.nationality,
  });

  ProvidersModel copyWith({
    int? id,
    String? name,
    String? avatar,
    String? rateAvg,
    String? nationality,
  }) {
    return ProvidersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      rateAvg: rateAvg ?? this.rateAvg,
      nationality: nationality ?? this.nationality,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(avatar != null){
      result.addAll({'avatar': avatar});
    }
    if(rateAvg != null){
      result.addAll({'rateAvg': rateAvg});
    }
    if(nationality != null){
      result.addAll({'nationality': nationality});
    }
  
    return result;
  }

  factory ProvidersModel.fromMap(Map<String, dynamic> map) {
    return ProvidersModel(
      id: map['id']?.toInt(),
      name: map['name'],
      avatar: map['avatar'],
      rateAvg: map['rate_avg'],
      nationality: map['nationality'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProvidersModel.fromJson(String source) => ProvidersModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProvidersModel(id: $id, name: $name, avatar: $avatar, rateAvg: $rateAvg, nationality: $nationality)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProvidersModel &&
      other.id == id &&
      other.name == name &&
      other.avatar == avatar &&
      other.rateAvg == rateAvg &&
      other.nationality == nationality;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      avatar.hashCode ^
      rateAvg.hashCode ^
      nationality.hashCode;
  }
}
