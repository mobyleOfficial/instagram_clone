abstract class InstagramCloneException implements Exception {}

class NoInternetException implements InstagramCloneException {}

class GenericException implements InstagramCloneException {}

class UnexpectedException implements InstagramCloneException {}

abstract class FormFieldException implements InstagramCloneException {}

class EmptyFormFieldException implements FormFieldException {}

class InvalidFormFieldException implements FormFieldException {}
