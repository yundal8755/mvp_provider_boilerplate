import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  final State state;

  late TaskProvider taskProvider;

  HomeViewModel(this.state) {
    taskProvider = Provider.of<TaskProvider>(state.context, listen: false);
  }

  void initFetch() {
    taskProvider.fetchTasks();
  }
}
