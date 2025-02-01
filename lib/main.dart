import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:spallawebapp/presentation/application/application_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy());

  GetIt.instance.registerSingleton<Logger>(
    Logger(
      printer: PrettyPrinter(
        printEmojis: false,
        noBoxingByDefault: false,
        dateTimeFormat: DateTimeFormat.onlyTime,
      ),
      // filter: ProductionFilter(),
    ),
  );

  runApp(
    const ApplicationWidget(),
  );
}
