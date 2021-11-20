import 'package:json_annotation/json_annotation.dart';
part 'create_account_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateAccountModel {
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String email;
  String password;
  String phone;
  String username;

  CreateAccountModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phone,
      required this.username});

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountModelToJson(this);
}

// json_annotation: ^4.3.0
// json_serializable: ^6.0.1

// @JsonSerializable()
// class User {
//   @JsonKey(name: '_id')
//   int id;
//   final String name;
//   final String email;
//
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
