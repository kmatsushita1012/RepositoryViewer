import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/models/repository.dart';
import 'package:repositoryviewer/page/settings.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';
import 'package:repositoryviewer/widgets/detailtile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  void _trailingPressed(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.detail,
        ),
        actions: [
          IconButton(
              onPressed: () => _trailingPressed(context),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Consumer<RepositoryProvider>(builder: (context, model, _) {
        Repository item = model.items[index];
        return Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(
                    child: Text(
                      item.name,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: NetworkImage(item.userIconPath),
                  )
                ]),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    DetailTile(
                        title: "Language",
                        icon: const Icon(Icons.language),
                        value: item.language),
                    DetailTile(
                        title: "Stars",
                        icon: const Icon(Icons.star),
                        value: item.star.toString()),
                    DetailTile(
                        title: "Watchers",
                        icon: const Icon(Icons.visibility),
                        value: item.watcher.toString()),
                    DetailTile(
                        title: "Forks",
                        icon: const Icon(Icons.fork_right),
                        value: item.fork.toString()),
                    DetailTile(
                        title: "Issues",
                        icon: const Icon(Icons.priority_high),
                        value: item.star.toString()),
                  ],
                )),
                const Spacer(),
              ],
            ));
      }),
    );
  }
}
