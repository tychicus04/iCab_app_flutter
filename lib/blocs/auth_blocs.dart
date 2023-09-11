import 'dart:async';
import 'package:flutter_booking_car/firebase/firebase_auth.dart';
import 'package:flutter_booking_car/validators/validation.dart';

class AuthBloc {
  final _fireAuth = FireAuth();

  final StreamController _nameController = StreamController();
  final StreamController _phoneController = StreamController();
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();

  Stream get nameController => _nameController.stream;
  Stream get phoneController => _phoneController.stream;
  Stream get emailController => _emailController.stream;
  Stream get passController => _passController.stream;

  bool isValidInfo(String name, String phone, String email, String pass) {
    if(!Validation.isValidName(name)) {
      _nameController.sink.addError('Vui lòng nhập tên');
      return false;
    }
    _nameController.sink.add('');
    if(!Validation.isValidPhone(phone)) {
      _phoneController.sink.addError('Số điện thoại không đúng định dạng');
      return false;
    }
    _phoneController.sink.add('');
    if(!Validation.isValidEmail(email)) {
      _emailController.sink.addError('Email không hợp lệ');
      return false;
    }
    _emailController.sink.add('');
    if(!Validation.isValidPass(pass)) {
      _passController.sink.addError('Mật khẩu phải có trên 5 kí tự');
      return false;
    }
    _passController.sink.add('');

    return true;
  }

  void signUp(String name, String phone, String email, String password, Function onSuccess, Function (String) onRegisterError) {
    _fireAuth.signUp(name, phone, email, password, onSuccess, onRegisterError);
  }

  void signIn(String email, String password, Function onSuccess, Function (String) onSignInError) {
    _fireAuth.signIn(email, password, onSuccess, onSignInError);

  }

  void dispose() {
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
  }
}