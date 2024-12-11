import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/models/repository.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';
import 'package:repositoryviewer/widgets/detailtile.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail",
          ),
        ),
        body: Consumer<RepositoryProvider>(builder: (context, model, _) {
          Repository item = model.items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                Text(item.name),
                Container(height: 40, child: Image.network(item.userIconPath))
              ]),
              Expanded(
                  child: ListView(
                children: [
                  DetailTile(
                      title: "Language",
                      icon: Icon(Icons.language),
                      value: item.language),
                  DetailTile(
                      title: "Star",
                      icon: Icon(Icons.star),
                      value: item.star.toString()),
                  DetailTile(
                      title: "Watcher",
                      icon: Icon(Icons.visibility),
                      value: item.watcher.toString()),
                  DetailTile(
                      title: "Fork",
                      icon: Icon(Icons.fork_right),
                      value: item.fork.toString()),
                  DetailTile(
                      title: "Issue",
                      icon: Icon(Icons.priority_high),
                      value: item.star.toString()),
                ],
              )),
            ],
          );
        }));
  }
}
