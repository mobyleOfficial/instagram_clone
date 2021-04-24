import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  const CustomSingleChildScrollView(
    this.child,
  );

  final Widget child;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      );
}
