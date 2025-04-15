import 'package:mvp_provider_boilerplate/data/dto/user_dto.dart';
import '../../domain/user_entity.dart';

/// 유저 관련 repository
/// - 실제로는 서버 API를 호출하거나 DB에 접근하는 로직이 들어간다.
/// - 여기서는 dummy data 예시만 작성.
class UserRepository {
  Future<UserEntity> getUser(int userId) async {
    // 예시: dummy로 "한 명"의 유저만 가져온다고 가정
    // 실제로는 REST API 호출 혹은 로컬 DB에서 읽기
    // 아래는 그냥 임의값
    final dto = UserDto(
        userId: userId, userName: 'John Doe', userEmail: 'john@example.com');
    return UserEntity(
      userId: dto.userId,
      userName: dto.userName,
      userEmail: dto.userEmail,
    );
  }
}
