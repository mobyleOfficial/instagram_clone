import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_colors.dart';

class InstagramCloneButton extends StatelessWidget {
  const InstagramCloneButton(
    this.text, {
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              onPressed == null ? InstagramCloneColors.babyBlue : Colors.blue,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              onPressed == null ? InstagramCloneColors.babyBlue : Colors.blue,
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
