import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mvp_provider_boilerplate/app/util/app_log.dart';
import 'package:mvp_provider_boilerplate/data/dto/task_dto.dart'; 
import '../../../domain/task_entity.dart';

class TaskRepository {
  /// Task Dummy Data를 불러옴
  Future<List<TaskEntity>> fetchTasks() async {
    // 실제 서버 API GET 호출 대신, 로컬 파일 load 시뮬레이션
    final jsonString = await rootBundle.loadString('assets/json/todo_dummy.json');

    // 200 응답이라고 가정
    final List<dynamic> jsonList = jsonDecode(jsonString);

    // DTO 생성 → Entity 변환
    final tasks = jsonList.map((e) {
      final dto = TaskDto.fromJson(e);
      return TaskEntity(
        taskId: dto.taskId,
        userId: dto.userId,
        title: dto.title,
        description: dto.description,
        isCompleted: dto.isCompleted,
      );
    }).toList();

    AppLog.d('TODO 개수 : ${tasks.length}');

    return tasks;
  }

  /// Task 새로 생성
  Future<TaskEntity> createTask(String title, String desc) async {
    // 실제로는 Dio/Http.post(...) → 서버 응답(200) 받음 → JSON -> DTO -> Entity
    // 여기서는 임의로 "성공" 응답을 가정
    final fakeResponse = {
      "taskId": DateTime.now().millisecondsSinceEpoch,
      "userId": 1,
      "title": title,
      "description": desc,
      "isCompleted": false
    };
    // DTO 변환
    final dto = TaskDto.fromJson(fakeResponse);
    // Entity 변환
    final entity = TaskEntity(
      taskId: dto.taskId,
      userId: dto.userId,
      title: dto.title,
      description: dto.description,
      isCompleted: dto.isCompleted,
    );
    return entity;
  }

  /// Task 업데이트
  Future<TaskEntity> updateTask(TaskEntity task) async {
    // 실제로는 서버에 PUT/PATCH 요청 후, 200이면 DTO->Entity
    // 여기서는 그냥 성공 가정
    return task;
  }
  
  /// Task 삭제
  Future<bool> deleteTask(int taskId) async {
    // 실제로는 서버에 DELETE 요청
    // 여기서는 그냥 true 반환(성공)
    return true;
  }
}
