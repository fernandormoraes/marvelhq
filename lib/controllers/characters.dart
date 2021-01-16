import 'dart:convert';
import 'package:marvelhq/models/character.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

Future<List<Character>> fetchCharacters(String privatekey, publickey)  async {
  final String hash = md5.convert(utf8.encode('1' + privatekey + publickey)).toString();
  final String url =
      'https://gateway.marvel.com/v1/public/characters?ts=1&apikey=$publickey&hash=$hash';

  final response = await http.get(url);
  if (response.statusCode == 200){
    final rest = json.decode(response.body);
    final rest2 = rest["data"];
    final parsed = rest2["results"];
    return parsed.map<Character>((json) => Character.fromJson(json)).toList();
  } else {
    return null;
  }
}
