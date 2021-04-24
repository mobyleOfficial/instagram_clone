import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:instagram_clone/presentation/common/span.dart';

class SpannableText extends StatelessWidget {
  const SpannableText(
    this.span,
  );

  final Span span;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: span.text.substring(
                0,
                span.text.indexOf(
                  span.spannableTextSection,
                ),
              ),
              style: span.textStyle,
            ),
            TextSpan(
              text: span.text.substring(
                span.text.indexOf(span.spannableTextSection),
                span.text.length,
              ),
              style: span.spannableStyle,
              recognizer: TapGestureRecognizer()..onTap = span.onTap,
            ),
          ],
        ),
      );
}
