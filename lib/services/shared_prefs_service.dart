import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  late Future<SharedPreferences> _sharedPreference;

  Future<SharedPreferenceService> init() async {
    _sharedPreference = SharedPreferences.getInstance();
    print("Shared preference service initialized");
    return this;
  }

  getString(String key) {
    return _sharedPreference.then((prefs) {
      return prefs.getString(key);
    });
  }

  setString(String key, String value) {
    return _sharedPreference.then((prefs) {
      return prefs.setString(key, value);
    });
  }

  getBool(String key) {
    return _sharedPreference.then((prefs) {
      return prefs.getBool(key);
    });
  }

  setBool(String key, bool value) {
    return _sharedPreference.then((prefs) {
      return prefs.setBool(key, value);
    });
  }

  getInt(String key) {
    return _sharedPreference.then((prefs) {
      return prefs.getInt(key) ?? null;
    });
  }

  setInt(String key, int value) {
    return _sharedPreference.then((prefs) {
      return prefs.setInt(key, value);
    });
  }

  remove(String key) {
    return _sharedPreference.then((prefs) {
      return prefs.remove(key);
    });
  }
}
