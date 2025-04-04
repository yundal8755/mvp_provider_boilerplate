// lib/feature/root/presentation/view_model/root_view_model.dart

import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/home/home_page.dart';

class RootViewModel {
  /// 현재 선택된 바텀 탭 인덱스
  int currentIndex = 0;

  /// 인덱스별로 보여줄 화면 목록
  final List<Widget> screens = [
    const HomePage(),
    const Center(child: Text('검색 화면')),
    const Center(child: Text('마이페이지 화면')),
  ];

  /// 인덱스 변경 메서드
  void updateIndex(int index) {
    currentIndex = index;
  }
}
