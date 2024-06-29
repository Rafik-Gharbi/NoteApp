import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class SharedPreferencesService {
  SecureSharedPref? _pref;

  static final SharedPreferencesService _singleton = SharedPreferencesService._internal();

  factory SharedPreferencesService() => _singleton;

  SharedPreferencesService._internal() {
    _init();
  }

  Future<void> _init() async {
    _pref ??= await SecureSharedPref.getInstance();
  }

  void put(String key, String value) {
    _pref!.putString(key, value, isEncrypted: true);
  }

  void read(String key) {
    _pref!.getString(key, isEncrypted: true);
  }
}
