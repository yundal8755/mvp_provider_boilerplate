// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialResponseModel _$SocialResponseModelFromJson(Map<String, dynamic> json) =>
    SocialResponseModel(
      email: json['email'] as String,
      signupCode: json['signupCode'] as String,
      signupMethod: json['signupMethod'] as String,
    );

Map<String, dynamic> _$SocialResponseModelToJson(
        SocialResponseModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'signupCode': instance.signupCode,
      'signupMethod': instance.signupMethod,
    };
