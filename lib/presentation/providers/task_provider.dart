import 'package:flutter/foundation.dart';
import '../../data/repository/task_repository.dart';
import '../../domain/task_entity.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository _taskRepository;

  TaskProvider(this._taskRepository);

  // 로컬 캐싱할 Entity 목록
  List<TaskEntity> _tasks = [];
  List<TaskEntity> get tasks => _tasks;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 에러 상태를 간단히 표현(실제로는 Error model을 더 디테일하게 할 수도 있음)
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // 목록 불러오기
  Future<void> fetchTasks() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _taskRepository.fetchTasks();
      _tasks = result;
    } catch (e) {
      _errorMessage = '할 일 목록을 가져오는 데 실패했습니다.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 새 할 일 추가
  Future<void> addTask(String title, String desc) async {
    try {
      final newTask = await _taskRepository.createTask(title, desc);
      // Entity 목록에 추가
      _tasks = [..._tasks, newTask];
      notifyListeners();
    } catch (e) {
      _errorMessage = '할 일 추가 실패';
      notifyListeners();
    }
  }

  // 완료 상태 토글
  Future<void> toggleComplete(int taskId) async {
    final index = _tasks.indexWhere((t) => t.taskId == taskId);
    if (index == -1) return;

    final current = _tasks[index];
    final updated = current.copyWith(isCompleted: !current.isCompleted);

    try {
      // 서버 반영
      final updatedEntity = await _taskRepository.updateTask(updated);
      // 로컬 상태 갱신
      _tasks[index] = updatedEntity;
      notifyListeners();
    } catch (e) {
      _errorMessage = '업데이트 실패';
      notifyListeners();
    }
  }

  // 삭제
  Future<void> removeTask(int taskId) async {
    try {
      final success = await _taskRepository.deleteTask(taskId);
      if (success) {
        _tasks.removeWhere((t) => t.taskId == taskId);
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = '삭제 실패';
      notifyListeners();
    }
  }
}
