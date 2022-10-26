class AppValidators {
  static AppValidators? _instace;
  static AppValidators get instance {
    _instace ??= AppValidators._init();
    return _instace!;
  }

  AppValidators._init();

  String? passwordCheck(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    } else if (password.length < 6) {
      return 'Your password is be longer than 6 char.';
    }
    return null;
  }

  String? twoPasswordCheck(String? password, String passwordV2) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    } else if (password != passwordV2) {
      return 'Password does not match.';
    } else if (password.length < 6 && passwordV2.length < 6) {
      return 'Your password is be longer than 6 char.';
    }
    return null;
  }

  String? emailCheck(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter a email';
    }
    if (RegExp(r'^(\S+@\S+\.\S+$)').hasMatch(email)) {
      return null;
    }
    return 'Invalid email';
  }

  String? nameCheck(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter a name.';
    }
    return null;
  }

  String? lastnameCheck(String? lastname) {
    if (lastname == null || lastname.isEmpty) {
      return 'Please enter a lastname';
    }
    return null;
  }
}