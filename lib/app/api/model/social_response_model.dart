import 'package:json_annotation/json_annotation.dart';

part 'social_response_model.g.dart';

@JsonSerializable()
class SocialResponseModel {
  final String email;
  final String signupCode;
  final String signupMethod;

  SocialResponseModel({
    required this.email,
    required this.signupCode,
    required this.signupMethod,
  });

  Map<String, dynamic> toJson() => _$SocialResponseModelToJson(this);
}
