class TaskDto {
  final int taskId;
  final int userId;
  final String title;
  final String description;
  final bool isCompleted;

  TaskDto({
    required this.taskId,
    required this.userId,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      taskId: json['taskId'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'userId': userId,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
