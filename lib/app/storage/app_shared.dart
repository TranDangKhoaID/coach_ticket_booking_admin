import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  static const prefsKeyFullName = "PREFS_KEY_FULLNAME";
  static const prefsKeyEmail = "PREFS_KEY_EMAIL";
  static const prefsKeyPhone = "PREFS_KEY_PHONE";
  static const prefsKeyUserID = "PREFS_KEY_UID";
  static const prefsKeyGarageLogged = "PREFS_KEY_GARAGE_LOGGED";
  static const prefsKeyDriverLogged = "PREFS_KEY_DRIVER_LOGGED";
  static const prefsKeyOptionLogged = "PREFS_KEY_OPTION_LOGGED";
}

class AppShared {
  static SharedPreferences? share;

  static Future<SharedPreferences?> init() async {
    share ??= await SharedPreferences.getInstance();
    return share;
  }
}

class AppPreferences {
  static AppPreferences? _instance;

  AppPreferences._();

  static AppPreferences get instance => _instance ??= AppPreferences._();

  Future<void> saveFullName(String fullName) async {
    AppShared.share?.setString(StorageKey.prefsKeyFullName, fullName);
  }

  String? getFullName() {
    return AppShared.share?.getString(StorageKey.prefsKeyFullName) ?? 'no name';
  }

  Future<void> saveEmail(String email) async {
    AppShared.share?.setString(StorageKey.prefsKeyEmail, email);
  }

  String? getEmail() {
    return AppShared.share?.getString(StorageKey.prefsKeyEmail) ??
        'abc@gmail.com';
  }

  Future<void> savePhone(String phone) async {
    AppShared.share?.setString(StorageKey.prefsKeyPhone, phone);
  }

  String? getPhone() {
    return AppShared.share?.getString(StorageKey.prefsKeyPhone) ?? '0';
  }

  Future<void> saveUserID(String uid) async {
    AppShared.share?.setString(StorageKey.prefsKeyUserID, uid);
  }

  String? getUserID() {
    return AppShared.share?.getString(StorageKey.prefsKeyUserID);
  }

  bool isLoggedIn() {
    return AppShared.share?.getBool(StorageKey.prefsKeyGarageLogged) ?? false;
  }

  Future<void> setIsLoggedIn() async {
    AppShared.share?.setBool(StorageKey.prefsKeyDriverLogged, true);
  }

  Future<void> saveOptionIsLoggedIn(int option) async {
    AppShared.share?.setInt(StorageKey.prefsKeyOptionLogged, option);
  }

  int? getOptionLoggedIn() {
    return AppShared.share?.getInt(StorageKey.prefsKeyOptionLogged) ?? 0;
  }

  // Future<void> setIsDriverLoggedIn() async {
  //   AppShared.share?.setBool(StorageKey.prefsKeyDriverLogged, true);
  // }

  // bool isDriverLoggedIn() {
  //   return AppShared.share?.getBool(StorageKey.prefsKeyDriverLogged) ?? false;
  // }

  Future<void> logout() async {
    AppShared.share?.remove(StorageKey.prefsKeyOptionLogged);
  }
}
