import 'package:json_annotation/json_annotation.dart';

part 'response_list_model.g.dart';

@JsonSerializable()
class ResponseListModel {
  // originJson을 List<Map<String, dynamic>> 로 교체
  List<Map<String, dynamic>> originJson;

  int? code;
  int? total;
  int? page;
  int? count;
  String? errorMsg;
  ErrorBean? error;

  ResponseListModel({
    this.originJson = const [],
    this.code,
    this.total,
    this.page,
    this.count,
    this.errorMsg,
    this.error,
  });

  factory ResponseListModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseListModelToJson(this);
}

@JsonSerializable()
class ErrorBean {
  final String errorMessage;
  final int errorCode;

  ErrorBean({
    this.errorMessage = '',
    this.errorCode = 0,
  });

  factory ErrorBean.fromJson(Map<String, dynamic> json) =>
      _$ErrorBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorBeanToJson(this);
}
