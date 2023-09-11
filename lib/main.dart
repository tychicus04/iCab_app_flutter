import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_car/blocs/auth_blocs.dart';
import 'package:flutter_booking_car/firebase_options.dart';
import 'package:flutter_booking_car/routes.dart';
import 'package:flutter_booking_car/src/app.dart';
import 'package:flutter_booking_car/src/screen/login_screen.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    AuthBloc(),
    MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    ),
  ));
}





