import 'dart:async';
import 'dart:developer' as developer;

import 'package:crypto_app/src/app_runner.dart';

void main() {
  runZonedGuarded(() => AppRunner().run(), (e, s) {
    developer.log(e.toString(), stackTrace: s);
  });
}
