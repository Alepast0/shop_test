import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shop_test/injection.dart';

import 'feature/data/data_source/hive.dart';
import 'main.dart';

class Env {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveInitializer.initializeHive();
    await initializeDateFormatting('ru_RU');
    final injectionContainer = await injection(const App());
    runApp(injectionContainer);
  }
}