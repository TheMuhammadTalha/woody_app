// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) {
  return AppointmentModel(
    status: json['status'] as int,
    personID: json['person'] as String?,
    vehicle: json['vehicle'] == null
        ? null
        : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
    type: json['type'] as int,
    service: json['service'] as int,
    description: json['description'] as String,
    date: DateTime.parse(json['date'] as String),
    timeSlot: json['time_slot'] == null
        ? null
        : TimeSlotModel.fromJson(json['time_slot'] as Map<String, dynamic>),
    address: json['address'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'person': instance.personID,
      'vehicle': instance.vehicle?.toJson(),
      'type': instance.type,
      'service': instance.service,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'time_slot': instance.timeSlot?.toJson(),
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
    };
