import 'dart:convert';
import 'package:marvelhq/models/comic.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

Future<List<Comic>> fetchComic(String privatekey, publickey)  async {
  final String hash = md5.convert(utf8.encode('1' + privatekey + publickey))
      .toString();
  final response = await http.get(
      'https://gateway.marvel.com/v1/public/comics?ts=1&apikey=$publickey&hash=$hash&limit=100');

  if (response.statusCode == 200) {
    final rest = json.decode(response.body);
    final rest2 = rest["data"];
    final parsed = rest2["results"];
    return parsed.map<Comic>((json) => Comic.fromJson(json)).toList();
  } else {
    return null;
  }
}

Future<Comic> fetchComicById(String privatekey, publickey, id)  async {
  final String hash = md5.convert(utf8.encode('1' + privatekey + publickey))
      .toString();
  final String url =
      'https://gateway.marvel.com/v1/public/comics/$id?ts=1&apikey=$publickey&hash=$hash&limit=100';

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final rest = json.decode(response.body);
    final rest2 = rest["data"];
    final parsed = rest2["results"];
    return Comic.fromJson(parsed[0]);
  } else {
    return null;
  }
}
