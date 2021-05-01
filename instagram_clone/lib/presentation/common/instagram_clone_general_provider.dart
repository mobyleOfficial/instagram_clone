import 'package:domain/data_repository/auth_repository.dart';
import 'package:domain/use_case/sign_in_uc.dart';
import 'package:domain/use_case/validate_empty_text_uc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/remote/repository/auth_repository_impl.dart';
import 'package:instagram_clone/presentation/auth/sign_in/sign_in_page.dart';
import 'package:instagram_clone/presentation/dummy/dummy_page.dart';
import 'package:instagram_clone/presentation/photo_list/photo_list_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../home_screen.dart';

class InstagramCloneGeneralProvider extends StatelessWidget {
  const InstagramCloneGeneralProvider(
    this.builder,
  );

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ..._buildRouteFactory(),
          ..._buildRepositoryProviders(),
          ..._buildUseCaseProviders(),
        ],
        child: builder(context),
      );

  List<SingleChildWidget> _buildRepositoryProviders() => [
        Provider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(),
        ),
      ];

  List<SingleChildWidget> _buildUseCaseProviders() => [
        Provider<ValidateEmptyTextUC>(
          create: (_) => ValidateEmptyTextUC(),
        ),
        ProxyProvider<AuthRepository, SignInUC>(
          update: (_, authRepository, __) => SignInUC(authRepository),
        ),
      ];

  List<SingleChildWidget> _buildRouteFactory() => [
        Provider<RouteFactory>(
          create: (context) => (settings) {
            if (settings.name == 'sign_in') {
              return MaterialPageRoute(
                builder: (_) => SignInPage.create(),
              );
            }

            if (settings.name == '/') {
              return MaterialPageRoute(
                builder: (_) => HomeScreen(),
              );
            }

            if (settings.name == 'photo_list') {
              return MaterialPageRoute(
                builder: (_) => PhotoListPage(),
              );
            }

            if (settings.name == 'dummy') {
              return MaterialPageRoute(
                builder: (_) => DummyPage(),
              );
            }

            return MaterialPageRoute(
              builder: (_) => Container(),
            );
          },
        ),
      ];
}
