// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speedyUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeedyUser _$SpeedyUserFromJson(Map<String, dynamic> json) => SpeedyUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      dynamicLink: json['dynamicLink'] as String,
    );

Map<String, dynamic> _$SpeedyUserToJson(SpeedyUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dynamicLink': instance.dynamicLink,
    };
