import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/models/sorttypes.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';
import 'package:repositoryviewer/widgets/repositorytile.dart';

class ListPage extends StatelessWidget {
  void _textChanged(RepositoryProvider model, String value) {
    model.setText(value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List",
          ),
        ),
        body: Consumer<RepositoryProvider>(
          builder: (context, model, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) => _textChanged(model, value),
              ),
              PopupMenuButton<SortTypes>(
                onSelected: (value) {
                  model.setSortType(value);
                },
                itemBuilder: (BuildContext context) {
                  return SortTypes.values.map((item) {
                    return PopupMenuItem<SortTypes>(
                        value: item, child: Text(item.toString()));
                  }).toList();
                },
                child: Text(
                  model.sortType.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: model.items.length,
                    itemBuilder: (context, index) =>
                        RepositoryTile(index: index)),
              )
            ],
          ),
        ));
  }
}
