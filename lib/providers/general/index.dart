import 'package:flutter/cupertino.dart';

class GeneralProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setloading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
