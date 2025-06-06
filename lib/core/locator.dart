// core/locator.dart
import 'package:get_it/get_it.dart';
import '../services/api_service.dart';
import '../services/local_storage_service.dart';
import '../repositories/task_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => TaskRepository(
    apiService: locator<ApiService>(),
    localStorageService: locator<LocalStorageService>(),
  ));
}
