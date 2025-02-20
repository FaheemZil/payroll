import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

enum ANSIColor {
  black._(30),
  blackBright._(90),
  blue._(34),
  blueBright._(93),
  cyan._(36),
  cyanBright._(96),
  green._(32),
  greenBright._(92),
  magenta._(35),
  magentaBright._(95),
  normal._(0),
  red._(31),
  redBright._(91),
  white._(37),
  whiteBright._(97),
  yellow._(33),
  yellowBright._(93);

  const ANSIColor._(this.code);

  final int code;
}

void printLog(
  Object? message, {
  String name = 'Log',
  ANSIColor color = ANSIColor.normal,
}) {
  if (kDebugMode) {
    Object? encodedMessage;
    try {
      // If the message is valid JSON, preetify it.
      // Useful for api responses
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      encodedMessage = encoder.convert(message);
    } catch (_) {
      encodedMessage = message;
    }
    log(
      '\x1B[${color.code}m'
      '$encodedMessage'
      '\x1B[${ANSIColor.normal.code}m',
      name: 'L/$name',
    );
  }
}
