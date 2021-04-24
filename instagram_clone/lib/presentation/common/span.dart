import 'package:flutter/material.dart';

class Span {
  const Span(
    this.text,
    this.spannableTextSection,
    this.textStyle,
    this.spannableStyle, {
    this.onTap,
  });

  final String text;
  final String spannableTextSection;
  final TextStyle textStyle;
  final TextStyle spannableStyle;
  final GestureTapCallback? onTap;
}
