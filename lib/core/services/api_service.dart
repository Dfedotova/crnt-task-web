import 'package:crnt_task/core/services/http_service.dart';
import 'package:crnt_task/locator.dart';
import 'package:crnt_task/models/project.dart';

class ApiService {
  final _httpService = locator<HttpService>();

  Future<List<Project>> fetchProjects() async {
    final sensorData = await _httpService.getHttp(
      route: 'app/',
    ) as List<dynamic>;
    //final sensorMap = jsonDecode(sensorData);
    final sensorList = <Project>[];
    for (final dataPoint in sensorData) {
      // sensorList.add(Project.fromJson(dataPoint as Map<String, dynamic>));
    }
    return sensorList;
  }

  Future<bool> loginWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _httpService.postHttp(
        route: 'token/',
        body: {'username': username, 'password': password},
      ) as Map<String, dynamic>;
      if (result['access'] != null) {
        final accessToken = result['access'] as String;
        final refreshToken = result['refresh'] as String;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
