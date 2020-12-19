import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.length >= 4 || email.length == 0) {
      sink.add(email);
    } else {
      sink.addError('Minimum is 4 characters');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8 || password.length == 0) {
      sink.add(password);
    } else {
      sink.addError('Minimum is 8 characters');
    }
  });
}
