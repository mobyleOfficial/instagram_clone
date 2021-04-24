//fafafa
import 'dart:ui';

import 'package:flutter/material.dart';

mixin InstagramCloneColors {
  static final Map<int, Color> _primaryColorSwatch = {
    50: vividBlue.withOpacity(.1),
    100: vividBlue.withOpacity(.2),
    200: vividBlue.withOpacity(.3),
    300: vividBlue.withOpacity(.4),
    400: vividBlue.withOpacity(.5),
    500: vividBlue.withOpacity(.6),
    600: vividBlue.withOpacity(.7),
    700: vividBlue.withOpacity(.8),
    800: vividBlue.withOpacity(.9),
    900: vividBlue.withOpacity(1)
  };

  static Color primaryColor = MaterialColor(
    vividBlue.value,
    _primaryColorSwatch,
  );

  static const Color vividBlue = Color(0xFF0095F6);

  static const Color darkBlue = Color(0xFF00376B);

  static const Color babyBlue = Color(0xFFB2DEFC);

  static const Color lynxWhite = Color(0xFFF7F7F7);

  static const Color darkGray = Color(0xFF787878);
}