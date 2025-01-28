import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:test/model/appointments_model.dart';
import 'package:test/model/providers_model.dart';
import 'package:test/model/service_model.dart';

class SalonModel {
  final int? id;
  final String? name;
  final String? desc;
  final String? image;
  final String? rateAvg;
  final int? countProvider;
  final String? hourHork;
  final bool? isOpen;
  final String? timeClose;
  final String? timeOpen;
  final List<ProvidersModel> providers;
  final List<ServicesModel> services;
  final List<AppointmentsModel> appointments;
  SalonModel({
    this.id,
    this.name,
    this.desc,
    this.image,
    this.rateAvg,
    this.countProvider,
    this.hourHork,
    this.isOpen,
    this.timeClose,
    this.timeOpen,
    required this.providers,
    required this.services,
    required this.appointments,
  });

  SalonModel copyWith({
    int? id,
    String? name,
    String? desc,
    String? image,
    String? rateAvg,
    int? countProvider,
    String? hourHork,
    bool? isOpen,
    String? timeClose,
    String? timeOpen,
    List<ProvidersModel>? providers,
    List<ServicesModel>? services,
    List<AppointmentsModel>? appointments,
  }) {
    return SalonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      rateAvg: rateAvg ?? this.rateAvg,
      countProvider: countProvider ?? this.countProvider,
      hourHork: hourHork ?? this.hourHork,
      isOpen: isOpen ?? this.isOpen,
      timeClose: timeClose ?? this.timeClose,
      timeOpen: timeOpen ?? this.timeOpen,
      providers: providers ?? this.providers,
      services: services ?? this.services,
      appointments: appointments ?? this.appointments,
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
    if (image != null) {
      result.addAll({'image': image});
    }
    if (rateAvg != null) {
      result.addAll({'rateAvg': rateAvg});
    }
    if (countProvider != null) {
      result.addAll({'countProvider': countProvider});
    }
    if (hourHork != null) {
      result.addAll({'hourHork': hourHork});
    }
    if (isOpen != null) {
      result.addAll({'isOpen': isOpen});
    }
    if (timeClose != null) {
      result.addAll({'timeClose': timeClose});
    }
    if (timeOpen != null) {
      result.addAll({'timeOpen': timeOpen});
    }
    result.addAll({'providers': providers.map((x) => x.toMap()).toList()});
    result.addAll({'services': services.map((x) => x.toMap()).toList()});
    result
        .addAll({'appointments': appointments.map((x) => x.toMap()).toList()});

    return result;
  }

  factory SalonModel.fromMap(Map<String, dynamic> map) {
    return SalonModel(
      id: map['id']?.toInt(),
      name: map['name'],
      desc: map['desc'],
      image: map['image'],
      rateAvg: map['rate_avg'],
      countProvider: map['count_providers']?.toInt(),
      hourHork: map['hour_work'],
      isOpen: map['is_open'],
      timeClose: map['time_close'],
      timeOpen: map['time_open'],
      providers: List<ProvidersModel>.from(
          map['providers']?.map((x) => ProvidersModel.fromMap(x))),
      services: List<ServicesModel>.from(
          map['type_service']?.map((x) => ServicesModel.fromMap(x))),
      appointments: List<AppointmentsModel>.from(
          map['appointments']?.map((x) => AppointmentsModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalonModel.fromJson(String source) =>
      SalonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SalonModel(id: $id, name: $name, desc: $desc, image: $image, rateAvg: $rateAvg, countProvider: $countProvider, hourHork: $hourHork, isOpen: $isOpen, timeClose: $timeClose, timeOpen: $timeOpen, providers: $providers, services: $services, appointments: $appointments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SalonModel &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.image == image &&
        other.rateAvg == rateAvg &&
        other.countProvider == countProvider &&
        other.hourHork == hourHork &&
        other.isOpen == isOpen &&
        other.timeClose == timeClose &&
        other.timeOpen == timeOpen &&
        listEquals(other.providers, providers) &&
        listEquals(other.services, services) &&
        listEquals(other.appointments, appointments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        image.hashCode ^
        rateAvg.hashCode ^
        countProvider.hashCode ^
        hourHork.hashCode ^
        isOpen.hashCode ^
        timeClose.hashCode ^
        timeOpen.hashCode ^
        providers.hashCode ^
        services.hashCode ^
        appointments.hashCode;
  }
}
