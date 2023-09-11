import 'package:flutter/material.dart';
import 'package:flutter_booking_car/blocs/auth_blocs.dart';

class MyApp extends InheritedWidget {
  final AuthBloc bloc;
  // ignore: annotate_overrides, overridden_fields
  final Widget child;
  const MyApp(this.bloc, this.child, {super.key}) : super(child: child);

  // This widget is the root of your application.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}