import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_car/helper/asset_helper.dart';
import 'package:flutter_booking_car/helper/image_helper.dart';
import 'package:flutter_booking_car/src/constants/color_constants.dart';
import 'package:flutter_booking_car/src/screen/login_screen.dart';
import 'package:flutter_booking_car/src/widget/button_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String routeName = "/register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _nameController =  TextEditingController();
  final TextEditingController _phoneController =  TextEditingController();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: ColorPallete.subTitle
        ),
        elevation: 0,
      ),
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
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: SizedBox(
                      width: 50,
                      child: Icon(FontAwesomeIcons.user)
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPallete.borderBox,
                        width: 1
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6))

                    )
                  ),
                )
              ),
              TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    prefixIcon: SizedBox(
                      width: 50,
                      child: Icon(FontAwesomeIcons.phone)
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPallete.borderBox,
                        width: 1
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6))

                    )
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: SizedBox(
                        width: 50,
                        child: Icon(FontAwesomeIcons.envelope)
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPallete.borderBox,
                          width: 1
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6))
              
                      )
                    ),
                  ),
              ),
                TextField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: SizedBox(
                      width: 50,
                      child: Icon(FontAwesomeIcons.lock)
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorPallete.borderBox,
                        width: 1
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6))
                    )
                  ),
                ),
                ButtonWidget(
                  title: 'Signup', 
                  onTap: () {}
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