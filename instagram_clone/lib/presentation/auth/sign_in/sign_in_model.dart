abstract class SignInState {}

abstract class SignInEvent {}

class NavigateToHomePageEvent extends SignInEvent {}

class Loading extends SignInState {}

class Idle extends SignInState {}