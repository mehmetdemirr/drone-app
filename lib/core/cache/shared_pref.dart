import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> setTheme(bool theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedKeyItem.theme.str(), theme);
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedKeyItem.theme.str()) ?? false;
  }

  Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedKeyItem.language.str(), language);
  }

  Future<String?> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeyItem.language.str());
  }
}

enum SharedKeyItem {
  theme,
  language,
}

extension SharedKeyItems on SharedKeyItem {
  String str() {
    return switch (this) {
      SharedKeyItem.theme => "theme",
      SharedKeyItem.language => "language",
    };
  }
}
