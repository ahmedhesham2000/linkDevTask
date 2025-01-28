import 'dart:convert';

class AppointmentsModel {
  final int? id;
  final String? dayAr;
  final String? dayEn;
  final String? fromTime;
  final String? toTime;
  AppointmentsModel({
    this.id,
    this.dayAr,
    this.dayEn,
    this.fromTime,
    this.toTime,
  });

  AppointmentsModel copyWith({
    int? id,
    String? dayAr,
    String? dayEn,
    String? fromTime,
    String? toTime,
  }) {
    return AppointmentsModel(
      id: id ?? this.id,
      dayAr: dayAr ?? this.dayAr,
      dayEn: dayEn ?? this.dayEn,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(dayAr != null){
      result.addAll({'dayAr': dayAr});
    }
    if(dayEn != null){
      result.addAll({'dayEn': dayEn});
    }
    if(fromTime != null){
      result.addAll({'fromTime': fromTime});
    }
    if(toTime != null){
      result.addAll({'toTime': toTime});
    }
  
    return result;
  }

  factory AppointmentsModel.fromMap(Map<String, dynamic> map) {
    return AppointmentsModel(
      id: map['id']?.toInt(),
      dayAr: map['name'],
      dayEn: map['type'],
      fromTime: map['from_time'],
      toTime: map['to_time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentsModel.fromJson(String source) => AppointmentsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppointmentsModel(id: $id, dayAr: $dayAr, dayEn: $dayEn, fromTime: $fromTime, toTime: $toTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AppointmentsModel &&
      other.id == id &&
      other.dayAr == dayAr &&
      other.dayEn == dayEn &&
      other.fromTime == fromTime &&
      other.toTime == toTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      dayAr.hashCode ^
      dayEn.hashCode ^
      fromTime.hashCode ^
      toTime.hashCode;
  }
}
