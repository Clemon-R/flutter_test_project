import 'dart:convert';

import 'package:test_project/job/services/http_service/enums/http_urls.dart';
import 'package:test_project/job/services/http_service/ihttp_service.dart';
import 'package:test_project/job/services/http_service/models/http_response.dart';
import 'package:test_project/job/services/http_service/models/http_request.dart';
import 'package:http/http.dart' as http;

class HttpService extends IHttpService {
  @override
  Future<HttpResponse<T>> get<T>(HttpRequest<T> request) async {
    var response = await http
        .get(Uri.parse(request.url.toUrl(params: request.params ?? {})));
    var json = jsonDecode(response.body);

    return HttpResponse<T>(response: request.fromJson(json));
  }
}
