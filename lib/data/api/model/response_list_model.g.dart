// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseListModel _$ResponseListModelFromJson(Map<String, dynamic> json) =>
    ResponseListModel(
      originJson: (json['originJson'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      code: (json['code'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      errorMsg: json['errorMsg'] as String?,
      error: json['error'] == null
          ? null
          : ErrorBean.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseListModelToJson(ResponseListModel instance) =>
    <String, dynamic>{
      'originJson': instance.originJson,
      'code': instance.code,
      'total': instance.total,
      'page': instance.page,
      'count': instance.count,
      'errorMsg': instance.errorMsg,
      'error': instance.error,
    };

ErrorBean _$ErrorBeanFromJson(Map<String, dynamic> json) => ErrorBean(
      errorMessage: json['errorMessage'] as String? ?? '',
      errorCode: (json['errorCode'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ErrorBeanToJson(ErrorBean instance) => <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
    };
