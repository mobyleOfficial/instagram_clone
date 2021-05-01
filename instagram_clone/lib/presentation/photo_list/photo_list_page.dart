import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('dummy');
          },
          child: Text('clica'),
        ),
      );
}
