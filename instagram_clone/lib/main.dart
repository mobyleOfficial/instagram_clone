import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:instagram_clone/presentation/auth/sign_in/sign_in_page.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_colors.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_general_provider.dart';

import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => InstagramCloneGeneralProvider(
        (_) => MaterialApp(
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
          initialRoute: '/',
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(
                builder: (_) => SignInPage.create(),
              );
            }

            return MaterialPageRoute(
              builder: (context) => Container(),
            );
          },
        ),
      );
}
