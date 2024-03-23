import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/themes/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePro = ref.watch(themeProvider);
    return Scaffold(
      body: Center(
        child: CupertinoSwitch(
          value: themePro.isDarkMode,
          onChanged: (val) {
            themePro.toggleTheme();
          },
        ),
      ),
    );
  }
}
