import 'package:crnt_task/core/services/http_service.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
    ..registerLazySingleton(NavigationService.new)
    ..registerLazySingleton(HttpService.new);
}
