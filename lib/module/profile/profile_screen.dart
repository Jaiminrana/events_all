import 'package:events_all/utils/extensions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
        'Profile Text',
        style: context.textTheme.displayLarge,
      ),
    );
  }
}
