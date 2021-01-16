import 'dart:convert';
import 'dart:io';
import 'package:marvelhq/models/comic.dart';
import 'package:path_provider/path_provider.dart';

class FavoritesStorage {

  Future get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future get _localFile async {
    final path = await _localPath;
    return File(path + '/favorites.dat');
  }

  Future writeFavorites(List favoritesList) async {
    try {
      final file = await _localFile;

      // Read the file
      String json =  jsonEncode(favoritesList);

      print("JSON writing to file: " + json);

      await file.writeAsString(json, mode: FileMode.write);

      return true;

    } catch (e) {
      print('error $e');
    }

    return false;
  }

  Future readFavorites() async {
    try {
      final file = await _localFile;

      // Read the file
      String jsonString = await file.readAsString();

      print("JSON reading from file: " + jsonString);

      Iterable jsonMap = jsonDecode(jsonString);

      List favs = jsonMap.map((parsedJson) => Comic.fromJson(parsedJson)).toList();

      return favs;

    } catch (e) {
      print('error');
    }

    return [];
  }
}