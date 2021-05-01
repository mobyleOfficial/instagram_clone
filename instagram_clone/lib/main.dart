import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_colors.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_general_provider.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  runApp(
    InstagramCloneGeneralProvider(
      (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          hintColor: InstagramCloneColors.darkGray,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: InstagramCloneColors.darkGray,
                displayColor: InstagramCloneColors.darkGray,
              ),
          fontFamily: 'ProximaNova',
        ),
        initialRoute: 'sign_in',
        onGenerateRoute: Provider.of<RouteFactory>(context, listen: false),
      );
}
