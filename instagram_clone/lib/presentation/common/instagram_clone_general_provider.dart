import 'package:domain/data_repository/auth_repository.dart';
import 'package:domain/use_case/sign_in_uc.dart';
import 'package:domain/use_case/validate_empty_text_uc.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/data/remote/repository/auth_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class InstagramCloneGeneralProvider extends StatelessWidget {
  const InstagramCloneGeneralProvider(
    this.builder,
  );

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
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
}
