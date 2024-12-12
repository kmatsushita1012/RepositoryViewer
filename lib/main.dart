import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/page/list.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RepositoryProvider(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en'),
          Locale('ja'),
          Locale('ko'),
        ],
        locale: const Locale('en'),
        // title: AppLocalizations.of(context)!.title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ListPage(),
      ),
    );
  }
}
