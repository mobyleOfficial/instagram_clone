import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: 1000,
            itemBuilder: (index, item) {
              return Text('Dummy Text');
            },
          ),
        ),
      );
}
