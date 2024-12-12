import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/providers/settings_provider.dart';
import 'package:repositoryviewer/widgets/selectabletile.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.language_setting,
        ),
      ),
      body: Consumer<SettingsProvider>(
          builder: (context, model, _) => Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: model.appLocalizationsEntryList.length,
                            itemBuilder: (context, index) {
                              Locale locale =
                                  model.appLocalizationsEntryList[index].key;
                              AppLocalizations appLocalizations =
                                  model.appLocalizationsEntryList[index].value;
                              return SelectableTile(
                                isSelected: locale.toLanguageTag() ==
                                    model.locale.toLanguageTag(),
                                text: appLocalizations.language_name,
                                onTap: () => model.setLocale(locale),
                              );
                            }))
                  ],
                ),
              )),
    );
  }
}
