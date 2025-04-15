class TaskEntity {
  final int taskId;
  final int userId;
  final String title;
  final String description;
  final bool isCompleted;

  TaskEntity({
    required this.taskId,
    required this.userId,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  TaskEntity copyWith({
    int? taskId,
    int? userId,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskEntity(
      taskId: taskId ?? this.taskId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
