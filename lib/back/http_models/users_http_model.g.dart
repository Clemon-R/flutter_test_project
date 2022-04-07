// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersHttpModel _$UsersHttpModelFromJson(Map<String, dynamic> json) =>
    UsersHttpModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => UserHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
