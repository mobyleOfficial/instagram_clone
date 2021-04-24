import 'package:domain/use_case/sign_in_uc.dart';
import 'package:domain/use_case/validate_empty_text_uc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/generated/l10n.dart';
import 'package:instagram_clone/presentation/auth/sign_in/sign_in_bloc.dart';
import 'package:instagram_clone/presentation/common/custom_single_child_scroll_view.dart';
import 'package:instagram_clone/presentation/common/edit_text.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_button.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_colors.dart';
import 'package:instagram_clone/presentation/common/span.dart';
import 'package:instagram_clone/presentation/common/spannable_text.dart';
import 'package:instagram_clone/presentation/common/view_utils.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage(
    this.bloc,
  );

  static Widget create() =>
      ProxyProvider2<ValidateEmptyTextUC, SignInUC, SignInBloc>(
        update: (_, validateEmptyTextUC, signInUC, bloc) =>
            bloc ?? SignInBloc(validateEmptyTextUC, signInUC),
        child: Consumer<SignInBloc>(
          builder: (_, bloc, __) => SignInPage(bloc),
        ),
      );

  final SignInBloc bloc;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: CustomSingleChildScrollView(
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _ChoseLanguageDropdown(),
                  Flexible(
                    child: _SignInBody(
                      bloc,
                    ),
                  ),
                  _SignInFooter(),
                ],
              ),
            ),
          ),
        ),
      );
}

class _ChoseLanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Text(
        'Português (Brasil)',
      );
}

class _SignInBody extends StatefulWidget {
  const _SignInBody(
    this.bloc,
  );

  final SignInBloc bloc;

  @override
  State<StatefulWidget> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<_SignInBody> {
  final TextEditingController _usernameTextController = TextEditingController();
  final _usernameFocusNode = FocusNode();

  final TextEditingController _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    _usernameFocusNode.addFocusLostListener(
      () => widget.bloc.onUsernameFocusLostSink.add(null),
    );

    _passwordFocusNode.addFocusLostListener(
      () => widget.bloc.onPasswordFocusLostSink.add(null),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/instagram_logo.png',
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 1.7,
            ),
            const SizedBox(
              height: 20,
            ),
            EditText(
              _usernameTextController,
              widget.bloc.usernameInputStatusStream,
              _usernameFocusNode,
              widget.bloc.onUsernameValueChangedSink.add,
              hint: S.of(context).sign_in_username_edit_text_hint,
            ),
            const SizedBox(
              height: 20,
            ),
            EditText(
              _passwordTextController,
              widget.bloc.passwordInputStatusStream,
              _passwordFocusNode,
              widget.bloc.onPasswordValueChangedSink.add,
              obscureText: true,
              hint: S.of(context).sign_in_password_edit_text_hint,
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
              stream: widget.bloc.onUpdateButtonState,
              builder: (context, snapshot) => InstagramCloneButton(
                S.of(context).sign_in_button_title,
                onPressed: snapshot.data ?? false
                    ? () {
                        widget.bloc.onSignInSink.add(null);
                      }
                    : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SpannableText(
              Span(
                S.of(context).sign_in_forgot_password_text,
                S.of(context).sign_in_forgot_password_spanned_text,
                const TextStyle(
                  color: InstagramCloneColors.darkGray,
                ),
                const TextStyle(
                  color: InstagramCloneColors.darkBlue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    S.of(context).sign_in_or_text,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/facebook_logo.png',
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  S.of(context).sign_in_with_facebook_text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: InstagramCloneColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class _SignInFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SpannableText(
              Span(
                S.of(context).sign_in_create_account_text,
                S.of(context).sign_in_create_account_spanned_text,
                const TextStyle(
                  color: InstagramCloneColors.darkGray,
                  fontSize: 15,
                ),
                const TextStyle(
                  color: InstagramCloneColors.darkBlue,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      );
}
