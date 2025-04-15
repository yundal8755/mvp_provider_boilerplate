class UserDto {
  final int userId;
  final String userName;
  final String userEmail;

  UserDto({
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  // JSON -> Dto
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
    );
  }

  // Dto -> JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
    };
  }
}
