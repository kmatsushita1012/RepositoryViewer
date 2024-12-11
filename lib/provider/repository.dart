import 'package:flutter/foundation.dart';
import 'package:repositoryviewer/model/repository.dart';

class RepositoryProvider extends ChangeNotifier {
  String text = "";
  String sortType = "";
  List<Repository> repositories = List.empty();
}
