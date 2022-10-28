import 'package:gorilla_hash/providers/general/index.dart';
import 'package:provider/provider.dart';

List<ListenableProvider> getProviders() {
  return [
    ListenableProvider<GeneralProvider>(
      create: (context) => GeneralProvider(),
    ),
  ];
}
