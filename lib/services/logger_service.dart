import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerService {
  late Logger _logger;

  Logger get logger => _logger;
  void initialize() {
    _logger = Logger(
      filter: kReleaseMode ? ProductionFilter() : null,
      printer: PrettyPrinter(
        methodCount: 2,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.dateAndTime
      )
    );
  }

  void dispose() {
    
  }
}