import 'package:json_annotation/json_annotation.dart';
import 'package:woody_app/api_models/time-slot_model.dart';
import 'package:woody_app/api_models/vehicle_model.dart';
part 'appointment-model.g.dart';


@JsonSerializable(explicitToJson: true)
class AppointmentModel {
  int status;
  @JsonKey(name: 'person')
  String? personID;
  VehicleModel? vehicle;
  int type;
  int service;
  String description;
  DateTime date;
  @JsonKey(name: 'time_slot')
  TimeSlotModel? timeSlot;
  String address;
  String city;
  String state;
  String zip;

  AppointmentModel({
    required this.status,
    required this.personID,
    this.vehicle,
    required this.type,
    required this.service,
    required this.description,
    required this.date,
    required this.timeSlot,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
