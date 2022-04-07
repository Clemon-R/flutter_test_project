import 'package:json_annotation/json_annotation.dart';

part 'picture_http_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class PictureHttpModel {
  final String large;
  final String medium;
  final String thumbnail;

  PictureHttpModel({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory PictureHttpModel.fromJson(Map<String, dynamic> json) =>
      _$PictureHttpModelFromJson(json);
}
