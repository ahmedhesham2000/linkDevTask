import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:test/model/service_model.dart';

class SalonsModel {
  final int? id;
  final String? name;
  final String? desc;
  final String? rateAvg;
  final int? countRate;
  final String? distance;
  final List<ServicesModel> services;
  SalonsModel({
    this.id,
    this.name,
    this.desc,
    this.rateAvg,
    this.countRate,
    this.distance,
    required this.services,
  });

  SalonsModel copyWith({
    int? id,
    String? name,
    String? desc,
    String? rateAvg,
    int? countRate,
    String? distance,
    List<ServicesModel>? services,
  }) {
    return SalonsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      rateAvg: rateAvg ?? this.rateAvg,
      countRate: countRate ?? this.countRate,
      distance: distance ?? this.distance,
      services: services ?? this.services,
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
    if (desc != null) {
      result.addAll({'desc': desc});
    }
    if (rateAvg != null) {
      result.addAll({'rateAvg': rateAvg});
    }
    if (countRate != null) {
      result.addAll({'countRate': countRate});
    }
    if (distance != null) {
      result.addAll({'distance': distance});
    }
    result.addAll({'services': services.map((x) => x.toMap()).toList()});

    return result;
  }

  factory SalonsModel.fromMap(Map<String, dynamic> map) {
    return SalonsModel(
      id: map['id']?.toInt(),
      name: map['name'],
      desc: map['desc'],
      rateAvg: map['rate_avg'],
      countRate: map['count_rate']?.toInt(),
      distance: map['distance'],
      services:
          List<ServicesModel>.from(map['services']?.map((x) => ServicesModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalonsModel.fromJson(String source) =>
      SalonsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SalonsModel(id: $id, name: $name, desc: $desc, rateAvg: $rateAvg, countRate: $countRate, distance: $distance, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SalonsModel &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.rateAvg == rateAvg &&
        other.countRate == countRate &&
        other.distance == distance &&
        listEquals(other.services, services);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        rateAvg.hashCode ^
        countRate.hashCode ^
        distance.hashCode ^
        services.hashCode;
  }
}

