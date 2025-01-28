import 'dart:convert';

class LoginModel {
  bool status;
  String message;
  var data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  

  LoginModel copyWith({
    bool? status,
    String? message,
    data,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'data': data.toMap()});
  
    return result;
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'] ?? false,
      message: map['message'] ?? '',
      data: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginModel &&
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
