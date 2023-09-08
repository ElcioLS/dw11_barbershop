import 'package:flutter/material.dart';

final class BarbershopNavGlobalKey {
  BarbershopNavGlobalKey._();

  final navKey = GlobalKey<NavigatorState>();

  static BarbershopNavGlobalKey? _instance;
  static BarbershopNavGlobalKey get instance =>
      _instance ??= BarbershopNavGlobalKey._();
}
