bool isValidEmail(String text) {
  return RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(text);
}

bool isValidName(String text) {
  return RegExp(r"^[a-zA-ZñÑ]+$").hasMatch(text);
}

bool isValidLastName(String text) {
  return RegExp(r"^[a-zA-ZñÑ]+$").hasMatch(text);
}
