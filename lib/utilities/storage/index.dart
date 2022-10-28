import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeST({required dynamic value, required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  String type = value.runtimeType.toString().toLowerCase();

  switch (type) {
    case 'bool':
      await prefs.setBool(key, value);
      break;
    case 'string':
      await prefs.setString(key, value);
      break;
    case 'int':
    case 'double':
      await prefs.setDouble(key, value);
      break;
    default:
  }
}

Future<dynamic> readST(String key) async {
  (await SharedPreferences.getInstance()).get(key);
}

Future<void> deleteST(String key) async {
  (await SharedPreferences.getInstance()).remove(key);
}
