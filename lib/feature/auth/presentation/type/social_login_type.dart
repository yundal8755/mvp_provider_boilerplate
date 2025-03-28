enum SocialLoginType {
  kakao('kakao'),
  naver('naver'),
  apple('apple'),
  google('google');

  const SocialLoginType(this.title);

  final String title;
}
