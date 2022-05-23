import 'package:cat_t/services/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'models/fact.dart';

void main() async {
  final dio = Dio();
  final client = ApiClient(dio);
  await Hive.initFlutter();
  await initializeDateFormatting();
  Hive.registerAdapter(FactAdapter());
  runApp(App(client: client, key: GlobalKey()));
}
