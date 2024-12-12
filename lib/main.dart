import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/page/list.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:repositoryviewer/providers/settings_provider.dart';
import 'package:repositoryviewer/utils/sharedpreference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingleton.init();
  if (SharedPreferencesSingleton().getString("locale") == null) {
    SharedPreferencesSingleton().setString("locale", 'en');
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => RepositoryProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<SettingsProvider>().locale,
      // title: AppLocalizations.of(context)!.title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
