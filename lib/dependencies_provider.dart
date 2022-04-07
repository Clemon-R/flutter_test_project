import 'package:get_it/get_it.dart';
import 'package:test_project/back/repositories/users_repository.dart';
import 'package:test_project/back/services/http_service.dart';
import 'package:test_project/job/iservice.dart';
import 'package:test_project/job/repositories/iusers_repository.dart';
import 'package:test_project/job/services/http_service/ihttp_service.dart';

import 'back/services/speedit_service.dart';
import 'job/services/ispeedit_service.dart';

abstract class DependenciesProvider {
  static final GetIt _getIt = GetIt.instance;

  static Future<bool> init() async {
    await _getIt.reset(dispose: true);

    _getIt
        .registerSingletonAsync<ISpeeditService>(() async => SpeeditService());
    _getIt.registerSingletonAsync<IHttpService>(() async => HttpService());
    _getIt.registerSingletonAsync<IUsersRepository>(
      () async => UsersRepository(),
      dependsOn: [IHttpService],
    );
    return true;
  }

  static T get<T extends IService>() {
    return _getIt.get<T>();
  }
}
