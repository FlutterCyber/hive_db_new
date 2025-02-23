import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internationalization/page_1.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const Page1(),
    );
  }
}
