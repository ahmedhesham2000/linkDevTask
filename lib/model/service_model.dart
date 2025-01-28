import 'dart:convert';

class ServicesModel {
  final int? id;
  final String? name;
  final String? image;
  ServicesModel({
    this.id,
    this.name,
    this.image,
  });


  ServicesModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return ServicesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
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
    if(image != null){
      result.addAll({'image': image});
    }
  
    return result;
  }

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      id: map['id']?.toInt(),
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicesModel.fromJson(String source) => ServicesModel.fromMap(json.decode(source));

  @override
  String toString() => 'ServicesModel(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServicesModel &&
      other.id == id &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
