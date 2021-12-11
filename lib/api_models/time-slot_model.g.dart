// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time-slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotModel _$TimeSlotModelFromJson(Map<String, dynamic> json) {
  return TimeSlotModel(
    to: json['to'] as String,
    from: json['from'] as String,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$TimeSlotModelToJson(TimeSlotModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'to': instance.to,
      'from': instance.from,
    };
