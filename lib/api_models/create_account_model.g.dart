// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountModel _$CreateAccountModelFromJson(Map<String, dynamic> json) {
  return CreateAccountModel(
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    role: json['role'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$CreateAccountModelToJson(CreateAccountModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'username': instance.username,
      'role': instance.role,
    };
