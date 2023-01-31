import 'package:clipboard/clipboard.dart';
import 'package:gorilla_hash/utilities/toast/index.dart';

copy(String data, context, {String? text}) {
  FlutterClipboard.copy(data);
  showToast(context, 'success', text ?? 'Copiado!', 1);
}
