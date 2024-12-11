import 'package:flutter/foundation.dart';
import 'package:repositoryviewer/models/repository.dart';
import 'package:repositoryviewer/models/sorttypes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepositoryProvider extends ChangeNotifier {
  String text = "";
  SortTypes sortType = SortTypes.updated;
  List<Repository> items = [];

  RepositoryProvider() {
    getRepositories(1);
  }

  void setText(String text) {
    this.text = text;
    items = [];
    getRepositories(1);
    notifyListeners();
  }

  void setSortType(SortTypes sortType) {
    this.sortType = sortType;
    items = [];
    getRepositories(1);
    notifyListeners();
  }

  void getRepositories(int page) {
    http
        .get(Uri.https(
      "api.github.com",
      "/search/repositories",
      {'q': text, 'sort': sortType.toString(), 'page': page.toString()},
    ))
        .then((response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        dynamic responseBody = utf8.decode(response.bodyBytes);
        dynamic parsedJson = jsonDecode(responseBody);
        for (var elem in parsedJson["items"]) {
          print(elem);
          try {
            Repository item = Repository.fromSearhRepositoryItem(elem);
            items.add(item);
          } catch (e) {
            print(e);
            continue;
          }
        }
        print(items);
        notifyListeners();
      }
    });
  }
}
