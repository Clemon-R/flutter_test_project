import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/back/http_models/name_http_model.dart';
import 'package:test_project/back/http_models/picture_http_model.dart';
import 'package:test_project/job/models/user_model.dart';

part 'user_http_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class UserHttpModel {
  final String gender;
  final NameHttpModel name;

  final PictureHttpModel picture;

  UserHttpModel({
    required this.gender,
    required this.name,
    required this.picture,
  });

  factory UserHttpModel.fromJson(Map<String, dynamic> json) =>
      _$UserHttpModelFromJson(json);

  UserModel toModel() {
    return UserModel(
      gender: gender,
      fullName: "${name.last} ${name.first}",
      picture: Uri.parse(picture.large),
    );
  }
}
