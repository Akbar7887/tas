import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tas/provider/models_provider.dart';
import 'package:tas/provider/section_provider.dart';
import 'package:tas/provider/simle_provider.dart';
import 'package:tas/user_pages/zero_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SimpleProvider()),
      ChangeNotifierProvider(create: (_) => ModelsProvider()),
      ChangeNotifierProvider(create: (_) => SectionProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tas group',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ZeroPage(),
      },
      // home: Home(),
    );
  }
}
