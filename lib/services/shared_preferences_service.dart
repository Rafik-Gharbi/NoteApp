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

  Future<void> put(String key, String value) async {
    await _pref!.putString(key, value, isEncrypted: true);
  }

  Future<String?> read(String key) async {
    return await _pref!.getString(key, isEncrypted: true);
  }
}
