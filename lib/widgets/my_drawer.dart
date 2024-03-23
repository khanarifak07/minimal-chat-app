import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/providers/auth_provider.dart';
import 'package:minimal_chat_app/screens/settings_page.dart';
import 'package:minimal_chat_app/utils.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authPro = ref.watch(authProvider);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            //logo
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 50,
                ),
              ),
            ),
            //home list tile
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text(
                  "H O M E",
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            //settings list tile
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text("S E T T I N G S"),
                onTap: () {
                  navigateToScreen(context, const SettingsPage());
                },
              ),
            ),
            const Spacer(),
            //logout list tile
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: const Text("L O G O U T"),
                onTap: () {
                  authPro.signOut();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
