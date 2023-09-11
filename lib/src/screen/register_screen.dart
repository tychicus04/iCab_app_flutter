import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_car/blocs/auth_blocs.dart';
import 'package:flutter_booking_car/core/helper/asset_helper.dart';
import 'package:flutter_booking_car/core/helper/image_helper.dart';
import 'package:flutter_booking_car/core/constants/color_constants.dart';
import 'package:flutter_booking_car/src/screen/home_screen.dart';
import 'package:flutter_booking_car/src/screen/login_screen.dart';
import 'package:flutter_booking_car/src/widget/button_widget.dart';
import 'package:flutter_booking_car/src/widget/loading_dialog.dart';
import 'package:flutter_booking_car/src/widget/msg_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String routeName = "/register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final AuthBloc authBloc = AuthBloc();

  final TextEditingController _nameController =  TextEditingController();
  final TextEditingController _phoneController =  TextEditingController();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passController =  TextEditingController();

  void onRegisterClicked() {
    if(authBloc.isValidInfo(_nameController.text, _phoneController.text, _emailController.text, _passController.text)) {
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      authBloc.signUp(_nameController.text, _phoneController.text, _emailController.text, _passController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, 'Sign-Up', msg);
      });
    }
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: const IconThemeData(
      //     color: ColorPallete.subTitle
      //   ),
      //   toolbarHeight: 10,
      //   elevation: 0,
      // ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              ImageHelper.loadFromAsset(
                AssetHelper.carRegister
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  'Welcome Abroad!',
                  style: TextStyle(
                    fontSize: 22,
                    color: ColorPallete.headTitle
                  )
                )
              ),
              const Text(
                'Signup with iCab with simple steps',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPallete.subTitle
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.nameController,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        prefixIcon: const SizedBox(
                          width: 50,
                          child: Icon(FontAwesomeIcons.user)
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPallete.borderBox,
                            width: 1
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                
                        )
                      ),
                    );
                  }
                )
              ),
              StreamBuilder(
                stream: authBloc.phoneController,
                builder: (context, snapshot) {
                  return TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        prefixIcon: const SizedBox(
                          width: 50,
                          child: Icon(FontAwesomeIcons.phone)
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorPallete.borderBox,
                            width: 1
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6))
              
                        )
                      ),
                    );
                }
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.emailController,
                  builder: (context, snapshot) {
                    return TextField(
                        controller: _emailController,
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
                            borderRadius: BorderRadius.all(Radius.circular(6))
                          )
                        ),
                    );
                  }
                ),
              ),
                StreamBuilder(
                  stream: authBloc.passController,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _passController,
                      obscureText: true,
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
                          borderRadius: BorderRadius.all(Radius.circular(6))
                        )
                      ),
                    );
                  }
                ),
                ButtonWidget(
                  title: 'Signup', 
                  onTap: onRegisterClicked
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already a User? ',
                      style: const TextStyle(
                        color: ColorPallete.subTitle,
                        fontSize: 16
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(LoginScreen.routeName);
                            },
                          text: 'Login Now',
                          style: const TextStyle(
                            color: ColorPallete.linkTitle,
                            fontSize: 16
                          )
                        )
                      ]
                    )
                  ),
                )
            ],
          )
        )
      )
    );
  }
}