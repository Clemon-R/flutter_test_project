// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHttpModel _$UserHttpModelFromJson(Map<String, dynamic> json) =>
    UserHttpModel(
      gender: json['gender'] as String,
      name: NameHttpModel.fromJson(json['name'] as Map<String, dynamic>),
      picture:
          PictureHttpModel.fromJson(json['picture'] as Map<String, dynamic>),
    );
