class Validations {
  static bool isEmail(String email) {
    bool emailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

    return emailValid;
  }
}
