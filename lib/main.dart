import 'dart:io';

import 'package:TAS/provider/models_provider.dart';
import 'package:TAS/provider/news_provider.dart';
import 'package:TAS/provider/section_provider.dart';
import 'package:TAS/provider/simle_provider.dart';
import 'package:TAS/user_pages/news_page1.dart';
import 'package:TAS/user_pages/zero_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  //
  //   HttpOverrides.global = new MyHttpOverrides();
  // HttpClient client = HttpClient();
  // client.badCertificateCallback =
  //     (X509Certificate cert, String host, int port) => true;
  HttpOverrides.global = MyHttpOverrides();
  // //
  // ByteData data = await rootBundle.load('assets/cant/taskey.pem');
  // SecurityContext context = SecurityContext.defaultContext;
  // context.setTrustedCertificatesBytes(data.buffer.asUint8List());
  // client = HttpClient(context: context);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SimpleProvider()),
      ChangeNotifierProvider(create: (_) => ModelsProvider()),
      ChangeNotifierProvider(create: (_) => SectionProvider()),
      ChangeNotifierProvider(create: (_) => NewsProvider()),

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
      debugShowCheckedModeBanner: false,
      title: 'Tas group',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ZeroPage(),
        'news1': (context) => NewsPage1(
    newsCompany: context.watch<NewsProvider>().getnewsCompany)
      },
      // home: Home(),
    );
  }
}
