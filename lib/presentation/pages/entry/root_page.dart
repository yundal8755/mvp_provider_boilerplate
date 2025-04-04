// lib/feature/root/presentation/view/root_page.dart

import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/presentation/pages/entry/root_view_model.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late RootViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RootViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _viewModel.screens[_viewModel.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewModel.currentIndex,
        onTap: (int index) {
          setState(() {
            _viewModel.updateIndex(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}
