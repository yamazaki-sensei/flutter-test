import 'dart:io';
import 'dart:async';
import 'dart:convert' show UTF8, LineSplitter;


class QiitaClient {
  Future<String> get() async {

    var completer = new Completer();

    var client = new HttpClient();
    var request = await client.getUrl(Uri.parse("http://www.google.co.jp"));

    var response = await request.close();
    var result = "";
    await for (var contents in response.transform(UTF8.decoder).transform(const LineSplitter())) {
      result += contents;
      print(result);
    }

    return completer.future;
  }
}