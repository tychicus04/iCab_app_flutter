import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_car/blocs/auth_blocs.dart';
import 'package:flutter_booking_car/core/helper/asset_helper.dart';
import 'package:flutter_booking_car/core/helper/image_helper.dart';
import 'package:flutter_booking_car/core/constants/color_constants.dart';
import 'package:flutter_booking_car/src/app.dart';
import 'package:flutter_booking_car/src/screen/home_screen.dart';
import 'package:flutter_booking_car/src/screen/register_screen.dart';
import 'package:flutter_booking_car/src/widget/button_widget.dart';
import 'package:flutter_booking_car/src/widget/loading_dialog.dart';
import 'package:flutter_booking_car/src/widget/msg_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = '/login_screen.dart';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthBloc authBloc = AuthBloc();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void onLoginClicked() {
    var bloc = MyApp.of(context)?.bloc;
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    authBloc.signIn(_emailController.text, _passController.text, () {
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, 'Sign-In', msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              ImageHelper.loadFromAsset(
                AssetHelper.carLogin
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: ColorPallete.headTitle
                      ),
                    ),
              ),
              const Text(
                'Login to continue using iCab',
                style: TextStyle(
                  fontSize: 16, 
                  color: ColorPallete.subTitle
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.emailController,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        prefixIcon: const SizedBox(
                          width: 50,
                          child: Icon(FontAwesomeIcons.envelope)
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPallete.borderBox, 
                            width: 1
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6)
                          )
                        )
                      ),
                    );
                  }
                )
              ),
              StreamBuilder(
                stream: authBloc.passController,
                builder: (context, snapshot) {
                  return TextField(
                      controller: _passController,
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black
                      ),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        prefixIcon: const SizedBox(
                          width: 50,
                          child: Icon(FontAwesomeIcons.lock)
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPallete.borderBox, 
                            width: 1
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6)
                          )
                        )
                      ),
                    );
                }
              ),
              Container(
                  constraints: BoxConstraints.loose(
                    const Size(double.infinity, 30)
                  ),
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorPallete.subTitle
                      ),
                    )
                  )
              ),
              ButtonWidget(
                title: 'Log in', 
                onTap: onLoginClicked
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                    text: 'New User? ',
                    style: const TextStyle(
                      color: ColorPallete.subTitle,
                      fontSize: 16
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed(RegisterScreen.routeName);
                          },
                        text: 'Sign up for a new account',
                        style: const TextStyle(
                          color: ColorPallete.linkTitle,
                          fontSize: 16
                        )
                      )
                    ]
                  )
                )
              )
            ],
          ),
        )
      ) 
    );
  }
}