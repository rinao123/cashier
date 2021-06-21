import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:cashier/common/global.dart';

class DimensionUtil {
  static final double _designWidth = 1366;

  static double get screenWidth => window.physicalSize.width / window.devicePixelRatio;

  static double get screenHeight => window.physicalSize.height / window.devicePixelRatio;

  static double get statusBarHeight {
    BuildContext context = navigatorKey.currentState!.overlay!.context;
    return MediaQuery.of(context).padding.top;
  }

  static double px2dp(num px, {bool isText: false}) {
    double dp = screenWidth / (_designWidth / window.devicePixelRatio) * px / window.devicePixelRatio;
    if (isText) {
      BuildContext context = navigatorKey.currentState!.overlay!.context;
      dp = dp / MediaQuery.of(context).textScaleFactor;
    }
    return dp;
  }
}