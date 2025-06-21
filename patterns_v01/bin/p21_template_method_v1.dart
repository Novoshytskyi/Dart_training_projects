abstract class FormValidator {
  void checkLogin() {
    print("Логин введен.");
  }

  void checkPassword() {
    print("Пароль действителен.");
  }

  void checkEmail() {}

  void hook() {}

  void validate() {
    checkLogin();
    checkPassword();
    checkEmail();
    hook();
  }
}

class RegFormValidator extends FormValidator {
  @override
  void checkLogin() {
    print("Логин введен и отвечает требованиям безопасности.");
  }

  @override
  void checkPassword() {
    print("Пароль введен и отвечает требованиям безопасности.");
  }

  @override
  void checkEmail() {
    print("Email действителен и подтвержден.");
  }
}

class AuthFormValidator extends FormValidator {
  @override
  void checkEmail() {}
}

class AdminFormValidator extends FormValidator {
  @override
  void checkEmail() {}

  @override
  void hook() {
    print("Пароль администратора действителен.");
  }
}

void main() {
  FormValidator regFormValidator = RegFormValidator();
  regFormValidator.validate();

  print('');

  FormValidator authFormValidator = AuthFormValidator();
  authFormValidator.validate();

  print('');

  FormValidator adminFormValidator = AdminFormValidator();
  adminFormValidator.validate();
}
