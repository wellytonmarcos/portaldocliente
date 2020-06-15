import 'package:portaldocliente/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements ILocalStorage {
  SharedPreferences _sharedPreferences;

  LocalStorageService();

  @override
  Future delete(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.remove(key);
  }

  @override
  Future get(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    }
  }
}
