// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utilisateur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Utilisateur _$$_UtilisateurFromJson(Map<String, dynamic> json) =>
    _$_Utilisateur(
      json[r'$id'] as String,
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$$_UtilisateurToJson(_$_Utilisateur instance) =>
    <String, dynamic>{
      r'$id': instance.uid,
      'name': instance.name,
      'email': instance.email,
    };
