import 'package:get_it/get_it.dart';
import 'package:test_project/back/services/http_service.dart';
import 'package:test_project/job/iservice.dart';
import 'package:test_project/job/services/ihttp_service.dart';

import 'back/services/speedit_service.dart';
import 'job/services/ispeedit_service.dart';

abstract class DependenciesProvider {
  static final GetIt _getIt = GetIt.instance;

  static Future<bool> init() async {
    await _getIt.reset(dispose: true);

    _getIt.registerSingleton<ISpeeditService>(SpeeditService());
    _getIt.registerSingleton<IHttpService>(HttpService());
    return true;
  }

  static T get<T extends IService>() {
    return _getIt.get<T>();
  }
}
