class Validation {
  static bool isValidName(String name) {
    return name.isNotEmpty;
  }
  static bool isValidPhone(String phone) {
    return phone.length >= 10;
  }
  static bool isValidEmail(String email) {
    return email.length > 6 && email.contains('@');
  }
  static bool isValidPass(String pass) {
    return pass.length > 5;
  } 
}