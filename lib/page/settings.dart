import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';
import 'package:repositoryviewer/widgets/proceedabletile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  void _onTap(BuildContext context, int index) {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.list,
          ),
        ),
        body: Consumer<RepositoryProvider>(
          builder: (context, model, _) => Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: model.items.length,
                      itemBuilder: (context, index) => ProceedableTile(
                          text: model.items[index].name,
                          onTap: (context) => _onTap(context, index))),
                )
              ],
            ),
          ),
        ));
  }
}
