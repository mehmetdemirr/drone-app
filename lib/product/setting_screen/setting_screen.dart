import 'package:auto_route/annotations.dart';
import 'package:demo/core/extension/string_extension.dart';
import 'package:demo/core/theme/dark_theme.dart';
import 'package:demo/core/theme/light_theme.dart';
import 'package:demo/core/theme/theme_view_model.dart';
import 'package:demo/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting Screen")),
      body: Column(
        children: [
          Text(
            LocaleKeys.hello.locale,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          _switchTheme(context, context.watch<ThemeNotifier>().getTheme()),
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 100)),
              );
            },
            child: const Text("takvim"),
          ),
        ],
      ),
    );
  }

  Switch _switchTheme(BuildContext context, bool result) {
    return Switch(
      value: result,
      onChanged: (value) {
        context.read<ThemeNotifier>().setTheme(value ? darkTheme : lightTheme);
      },
    );
  }
}
