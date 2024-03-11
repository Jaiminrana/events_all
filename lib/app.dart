import 'package:events_all/generated/l10n.dart';
import 'package:events_all/module/home.dart';
import 'package:events_all/module/home_store.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:events_all/values/app_theme.dart';
import 'package:flutter/material.dart';

class AllEventsApp extends StatelessWidget {
  const AllEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      localizationsDelegates: const [Str.delegate],
      home: const Home().withProvider(
        HomeStore(),
        dispose: (store) => store.dispose(),
      ),
    );
  }
}
