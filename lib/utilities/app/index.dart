import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  Future<String> getVersionApp() async {
    return (await PackageInfo.fromPlatform()).version;
  }
}
