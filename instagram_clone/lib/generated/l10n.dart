// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Instagram Clone`
  String get app_name {
    return Intl.message(
      'Instagram Clone',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Empty field`
  String get default_empty_text_error_message {
    return Intl.message(
      'Empty field',
      name: 'default_empty_text_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Invalid field`
  String get default_invalid_text_error_message {
    return Intl.message(
      'Invalid field',
      name: 'default_invalid_text_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Phone number, email or username`
  String get sign_in_username_edit_text_hint {
    return Intl.message(
      'Phone number, email or username',
      name: 'sign_in_username_edit_text_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sign_in_password_edit_text_hint {
    return Intl.message(
      'Password',
      name: 'sign_in_password_edit_text_hint',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get sign_in_button_title {
    return Intl.message(
      'Log in',
      name: 'sign_in_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Forgot yout login details? Get help logging in.`
  String get sign_in_forgot_password_text {
    return Intl.message(
      'Forgot yout login details? Get help logging in.',
      name: 'sign_in_forgot_password_text',
      desc: '',
      args: [],
    );
  }

  /// `Get help logging in.`
  String get sign_in_forgot_password_spanned_text {
    return Intl.message(
      'Get help logging in.',
      name: 'sign_in_forgot_password_spanned_text',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get sign_in_or_text {
    return Intl.message(
      'OR',
      name: 'sign_in_or_text',
      desc: '',
      args: [],
    );
  }

  /// `Log in with Facebook`
  String get sign_in_with_facebook_text {
    return Intl.message(
      'Log in with Facebook',
      name: 'sign_in_with_facebook_text',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? Sign up.`
  String get sign_in_create_account_text {
    return Intl.message(
      'Don\'t have an account? Sign up.',
      name: 'sign_in_create_account_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign up.`
  String get sign_in_create_account_spanned_text {
    return Intl.message(
      'Sign up.',
      name: 'sign_in_create_account_spanned_text',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}