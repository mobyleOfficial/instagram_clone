// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "app_name" : MessageLookupByLibrary.simpleMessage("Instagram Clone"),
    "default_empty_text_error_message" : MessageLookupByLibrary.simpleMessage("Empty field"),
    "default_invalid_text_error_message" : MessageLookupByLibrary.simpleMessage("Invalid field"),
    "sign_in_button_title" : MessageLookupByLibrary.simpleMessage("Log in"),
    "sign_in_create_account_spanned_text" : MessageLookupByLibrary.simpleMessage("Sign up."),
    "sign_in_create_account_text" : MessageLookupByLibrary.simpleMessage("Don\'t have an account? Sign up."),
    "sign_in_forgot_password_spanned_text" : MessageLookupByLibrary.simpleMessage("Get help logging in."),
    "sign_in_forgot_password_text" : MessageLookupByLibrary.simpleMessage("Forgot yout login details? Get help logging in."),
    "sign_in_or_text" : MessageLookupByLibrary.simpleMessage("OR"),
    "sign_in_password_edit_text_hint" : MessageLookupByLibrary.simpleMessage("Password"),
    "sign_in_username_edit_text_hint" : MessageLookupByLibrary.simpleMessage("Phone number, email or username"),
    "sign_in_with_facebook_text" : MessageLookupByLibrary.simpleMessage("Log in with Facebook")
  };
}
