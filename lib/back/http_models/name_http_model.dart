import 'package:json_annotation/json_annotation.dart';

part 'name_http_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class NameHttpModel {
  final String title;
  final String first;
  final String last;

  NameHttpModel({
    required this.title,
    required this.first,
    required this.last,
  });

  factory NameHttpModel.fromJson(Map<String, dynamic> json) =>
      _$NameHttpModelFromJson(json);
}
