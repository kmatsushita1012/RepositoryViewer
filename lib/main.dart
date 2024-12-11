import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repositoryviewer/page/list.dart';
import 'package:repositoryviewer/providers/repository_provider.dart';

void main() {
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
        title: 'Repository Viewer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ListPage(),
      ),
    );
  }
}
