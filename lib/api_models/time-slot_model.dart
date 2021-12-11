import 'package:json_annotation/json_annotation.dart';
part 'time-slot_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeSlotModel{
  @JsonKey(name: '_id')
  String? id;
  String to;
  String from;

  TimeSlotModel({required this.to,required this.from});
  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotModelToJson(this);
}