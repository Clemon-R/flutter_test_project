import 'package:test_project/job/iservice.dart';
import 'package:test_project/job/services/http_service/models/http_response.dart';

import 'models/http_request.dart';

abstract class IHttpService extends IService {
  Future<HttpResponse<T>> get<T>(HttpRequest<T> request);
}
