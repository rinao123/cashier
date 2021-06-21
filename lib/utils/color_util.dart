import 'package:flutter/material.dart';

class ColorUtil {
  static final Color black = getColorFromString('#333333');
  static final Color white = getColorFromString('#FFFFFF');
  static final Color grayBackground = getColorFromString('#DCDFE6');
  static final Color grayText = getColorFromString('#A6ADB8');
  static final Color blue = getColorFromString('#2E7BFD');

  static Color getColorFromString(String str) {
    if (str.isEmpty) {
      return Colors.transparent;
    } else if (str.contains('#')) {
      return getColorFromHex(str);
    } else {
      return getColorFromRGBA(str);
    }
  }

  static Color getColorFromRGBA(String rgba) {
    rgba = rgba.toUpperCase().replaceAll(' ', '');
    int leftIndex = rgba.indexOf('(');
    if (leftIndex <= -1) {
      return Colors.transparent;
    }
    rgba = rgba.substring(leftIndex + 1);
    int rightIndex = rgba.indexOf(')');
    if (rightIndex <= -1) {
      return Colors.transparent;
    }

    rgba = rgba.substring(0, rightIndex);
    List<String> values = rgba.split(',');
    if (values.length < 4) {
      return Colors.transparent;
    }
    int red = int.parse(values[0]);
    int green = int.parse(values[1]);
    int blue = int.parse(values[2]);
    double opacity = double.parse(values[3]);
    return Color.fromRGBO(red, green, blue, opacity);
  }

  static Color getColorFromHex(String hex) {
    String hexColor = hex.toUpperCase().replaceAll('#', '');
    if (hexColor.length != 6) {
      return Colors.transparent;
    }
    hexColor = 'FF' + hexColor;
    return Color(int.parse(hexColor, radix: 16));
  }
}