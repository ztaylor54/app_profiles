// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'items': instance.items,
      'isActive': instance.isActive,
    };
