import 'package:flutter/material.dart';
import 'package:flutter_booking_car/src/screen/login_screen.dart';
import 'package:flutter_booking_car/src/screen/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
};