import 'package:shared_preferences/shared_preferences.dart';

writeST(String key, dynamic value, String type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  switch (type) {
    case 'string':
      prefs.setString(key, value);
      break;
    case 'double':
      prefs.setDouble(key, value);
      break;
    case 'int':
      prefs.setInt(key, value);
      break;
    default:
  }
}

readST(String key, String type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  dynamic value;

  switch (type) {
    case 'string':
      value = prefs.getString(key);
      if (value != null) {
        value = value.replaceAll('"', '');
      }
      break;
    case 'double':
      value = prefs.getDouble(key);
      break;
    case 'int':
      value = prefs.getInt(key);
      break;
    default:
      value = '';
  }

  return value;
}

Future<void> deleteST(String key) async {
  (await SharedPreferences.getInstance()).remove(key);
}
