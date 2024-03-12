import 'package:events_all/auth/auth.dart';
import 'package:events_all/generated/l10n.dart';
import 'package:events_all/utils/common%20widgets/ae_network_Image.dart';
import 'package:events_all/utils/extensions.dart';
import 'package:events_all/values/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (currentUser != null) ...[
            AENetworkImage.oval(
              url: currentUser.photoURL!,
              height: 130,
              width: 130,
            ),
          ],
          const SizedBox(height: 10),
          Text(
            sprintf(
              AppStrings.userString,
              [Str.current.user, currentUser?.displayName],
            ),
            style: context.textTheme.displayLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Auth.instance.logOut();
            },
            child: Text(Str.current.logOut),
          ),
        ],
      ),
    );
  }
}
