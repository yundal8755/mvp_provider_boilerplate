// lib/app/di/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:mvp_provider_boilerplate/data/repository/task_repository.dart';
import 'package:mvp_provider_boilerplate/data/repository/user_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepository());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository());
}
