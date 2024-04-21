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

  Future<void> setCustomerToken(String customerToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedKeyItem.customerToken.str(), customerToken);
  }

  Future<String?> getCustomerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeyItem.customerToken.str());
  }

  Future<void> setCompanyToken(String companyToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedKeyItem.companyToken.str(), companyToken);
  }

  Future<String?> getCompanyToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeyItem.companyToken.str());
  }

  Future<void> setCompanyId(int companyId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedKeyItem.companyId.str(), companyId);
  }

  Future<int?> getCompanyId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedKeyItem.companyId.str());
  }
}

enum SharedKeyItem {
  theme,
  language,
  customerToken,
  companyToken,
  companyId,
}

extension SharedKeyItems on SharedKeyItem {
  String str() {
    return switch (this) {
      SharedKeyItem.theme => "theme",
      SharedKeyItem.language => "language",
      SharedKeyItem.companyId => "companyId",
      SharedKeyItem.companyToken => "companyToken",
      SharedKeyItem.customerToken => "customerToken",
    };
  }
}
