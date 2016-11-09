import 'dart:io';


class QiitaClient {
  void get() {
    var client = new HttpClient();
    client.getUrl(Uri.parse("http://www.google.co.jp")).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      print(response.headers);
    });
  }
}