const String base = 'https://www.donitaa.com';
const String base_api = 'https://www.donitaa.com/api/v1/';

////FUNCTIONS///////
String getUrl(String path) {
  return base_api + path;
}

Uri getUri(String path) {
  print(Uri.parse(base_api + path));
  return Uri.parse(base_api + path);
}

class Universe {
  static getData(Map<String, dynamic>? data) {
    return data!['data'] ?? [];
  }

  static getData2(List<dynamic>? data) {
    return data!;
  }
}
