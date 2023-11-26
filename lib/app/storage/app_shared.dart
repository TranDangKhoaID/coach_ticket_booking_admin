import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  static const prefsKeyFullName = "PREFS_KEY_FULLNAME";

  static const prefsKeyEmail = "PREFS_KEY_EMAIL";
  static const prefsKeyPassword = "PREFS_KEY_PASSWORD";
  static const prefsKeyIsCheck = "PREFS_KEY_ISCHECK";

  static const prefsKeyPhone = "PREFS_KEY_PHONE";
  static const prefsKeyUserID = "PREFS_KEY_UID";
  static const prefsKeyGarageLogged = "PREFS_KEY_GARAGE_LOGGED";
  static const prefsKeyDriverLogged = "PREFS_KEY_DRIVER_LOGGED";
  static const prefsKeyOptionLogged = "PREFS_KEY_OPTION_LOGGED";
  static const prefsKeyCarID = "PREFS_KEY_CAR_ID";
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

  //remember me
  Future<void> saveEmail(String email) async {
    AppShared.share?.setString(StorageKey.prefsKeyEmail, email);
  }

  String? getEmail() {
    return AppShared.share?.getString(StorageKey.prefsKeyEmail) ?? '';
  }

  Future<void> savePass(String password) async {
    AppShared.share?.setString(StorageKey.prefsKeyPassword, password);
  }

  String? getPass() {
    return AppShared.share?.getString(StorageKey.prefsKeyPassword) ?? '';
  }

  Future<void> saveCheck(bool check) async {
    AppShared.share?.setBool(StorageKey.prefsKeyIsCheck, check);
  }

  bool? getCheck() {
    return AppShared.share?.getBool(StorageKey.prefsKeyIsCheck) ?? false;
  }

  //
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

  Future<void> saveCarID(String carID) async {
    AppShared.share?.setString(StorageKey.prefsKeyCarID, carID);
  }

  String? getCarID() {
    return AppShared.share?.getString(StorageKey.prefsKeyCarID);
  }

  Future<void> deleteRememberme() async {
    AppShared.share?.remove(StorageKey.prefsKeyEmail);
    AppShared.share?.remove(StorageKey.prefsKeyPassword);
    AppShared.share?.remove(StorageKey.prefsKeyIsCheck);
  }

  Future<void> logout() async {
    AppShared.share?.remove(StorageKey.prefsKeyCarID);
    AppShared.share?.remove(StorageKey.prefsKeyOptionLogged);
  }
}
