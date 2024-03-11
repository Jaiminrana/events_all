import 'package:events_all/apibase/repository.dart';
import 'package:events_all/app.dart';
import 'package:events_all/utils/helper.dart';
import 'package:flutter/material.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  @override
  void initState() {
    setAppOrientation();
    Repository.instance.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AllEventsApp();
  }
}
