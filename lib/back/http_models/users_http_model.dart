import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/job/models/users_model.dart';

import 'user_http_model.dart';

part 'users_http_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class UsersHttpModel {
  final List<UserHttpModel> results;

  UsersHttpModel({required this.results});

  factory UsersHttpModel.fromJson(Map<String, dynamic> json) =>
      _$UsersHttpModelFromJson(json);

  UsersModel toModel() {
    return UsersModel(
      users: results.map((e) => e.toModel()).toList(),
    );
  }
}
