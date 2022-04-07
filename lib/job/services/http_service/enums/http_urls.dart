enum HttpUrls {
  root,
}

extension HttpUrlsExt on HttpUrls {
  String toUrl({required Map<String, String> params}) {
    switch (this) {
      case HttpUrls.root:
        return "https://randomuser.me/api/?page=${params['page']}&results=10";
    }
  }
}
