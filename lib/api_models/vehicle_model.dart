import 'package:json_annotation/json_annotation.dart';
part 'vehicle_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VehicleModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'person')
  String personID;
  String year;
  String make;
  String model;
  String vin;

  VehicleModel(
      {required this.personID,
      required this.year,
      required this.make,
      required this.model,
      required this.vin});

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
