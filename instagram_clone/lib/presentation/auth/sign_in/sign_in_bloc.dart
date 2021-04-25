import 'package:domain/use_case/sign_in_uc.dart';
import 'package:domain/use_case/validate_empty_text_uc.dart';
import 'package:instagram_clone/presentation/auth/sign_in/sign_in_model.dart';
import 'package:instagram_clone/presentation/common/input_status_vm.dart';
import 'package:instagram_clone/presentation/common/subscription_holder.dart';
import 'package:rxdart/rxdart.dart';
import 'package:instagram_clone/presentation/common/view_utils.dart';

class SignInBloc with SubscriptionHolder {
  SignInBloc(
    this._validateEmptyTextUC,
    this._signInUC,
  ) {
    _onUsernameFocusLostSubject
        .listen(
          (_) => _emptyTextValidationStream(
              _usernameInputStatusSubject, usernameValue),
        )
        .addTo(subscriptions);

    _onPasswordFocusLostSubject
        .listen(
          (_) => _emptyTextValidationStream(
              _passwordInputStatusSubject, passwordValue),
        )
        .addTo(subscriptions);

    MergeStream([]);

    _onSignInSubject
        .flatMap(
          (_) => Future.wait(
            [
              _emptyTextValidationStream(
                  _passwordInputStatusSubject, passwordValue),
              _emptyTextValidationStream(
                  _usernameInputStatusSubject, usernameValue),
            ],
            eagerError: false,
          ).asStream(),
        )
        .flatMap(
          (_) => _signIn(),
        )
        .listen(_onSignInStateSubject.add)
        .addTo(subscriptions);

    // Enable/Disable button
    Rx.combineLatest2<bool, bool, bool>(
      _usernameInputStatusSubject.map(
        (status) => status == InputStatusVM.valid,
      ),
      _passwordInputStatusSubject.map(
        (status) => status == InputStatusVM.valid,
      ),
      (
        isSecondNameValid,
        isNameValid,
      ) =>
          isNameValid && isSecondNameValid,
    )
        .listen(
          _onUpdateButtonStateSubject.add,
        )
        .addTo(subscriptions);
  }

  final ValidateEmptyTextUC _validateEmptyTextUC;
  final SignInUC _signInUC;

  // Sign in State
  final _onSignInStateSubject = BehaviorSubject<SignInState>.seeded(Idle());

  Stream<SignInState> get signInStateStream => _onSignInStateSubject.stream;

  // Sign in Events
  final _onSignInEventSubject = PublishSubject<SignInEvent>();

  Stream<SignInEvent> get signInEventStream => _onSignInEventSubject.stream;

  // Collection Name
  final _onUsernameValueChangedSubject = BehaviorSubject<String>();
  final _usernameInputStatusSubject = PublishSubject<InputStatusVM>();
  final _onUsernameFocusLostSubject = PublishSubject<void>();

  String get usernameValue => _onUsernameValueChangedSubject.stream.value ?? "";

  Sink<String> get onUsernameValueChangedSink =>
      _onUsernameValueChangedSubject.sink;

  Sink<void> get onUsernameFocusLostSink => _onUsernameFocusLostSubject.sink;

  Stream<InputStatusVM> get usernameInputStatusStream =>
      _usernameInputStatusSubject.stream;

  // Password Name
  final _onPasswordValueChangedSubject = BehaviorSubject<String>();
  final _passwordInputStatusSubject = PublishSubject<InputStatusVM>();
  final _onPasswordFocusLostSubject = PublishSubject<void>();

  String get passwordValue => _onPasswordValueChangedSubject.stream.value ?? "";

  Sink<String> get onPasswordValueChangedSink =>
      _onPasswordValueChangedSubject.sink;

  Sink<void> get onPasswordFocusLostSink => _onPasswordFocusLostSubject.sink;

  Stream<InputStatusVM> get passwordInputStatusStream =>
      _passwordInputStatusSubject.stream;

  // Button State
  final _onUpdateButtonStateSubject = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get onUpdateButtonState => _onUpdateButtonStateSubject.stream;

  // Button Action
  final _onSignInSubject = PublishSubject<void>();

  Sink<void> get onSignInSink => _onSignInSubject.sink;

  // Sign in
  Stream<SignInState> _signIn() async* {
    yield Loading();

    try {
      await _signInUC.getFuture(
        SignInUCParams(usernameValue, passwordValue),
      );

      _onSignInEventSubject.add(
        NavigateToHomePageEvent(),
      );

      // do something
    } catch (error) {
      // do something
    } finally {
      yield Idle();
    }
  }

  // Validation Functions
  Future<void> _emptyTextValidationStream(
          Sink<InputStatusVM> sink, String text) =>
      _validateEmptyTextUC
          .getFuture(
            ValidateEmptyTextUCParams(text),
          )
          .addStatusToSink(sink);
}
