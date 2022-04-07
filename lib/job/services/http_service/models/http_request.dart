import '../enums/http_urls.dart';

class HttpRequest<T> {
  final HttpUrls url;
  final T Function(dynamic json) fromJson;
  final Map<String, String>? params;

  HttpRequest({required this.url, required this.fromJson, this.params});
}
