// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return VehicleModel(
    personID: json['person'] as String,
    year: json['year'] as String,
    make: json['make'] as String,
    model: json['model'] as String,
    vin: json['vin'] as String,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'person': instance.personID,
      'year': instance.year,
      'make': instance.make,
      'model': instance.model,
      'vin': instance.vin,
    };
