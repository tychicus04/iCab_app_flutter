// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String name, String phone, String email, String password, Function onSuccess, Function(String) onRegisterError) async {
    try {
      UserCredential result = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      _createUser(user!.uid, name, phone, email, password, onSuccess, onRegisterError);
    } catch(err) {
      print("Error: " + err.toString());
      _onSignUpError(err.toString(), onRegisterError);
    }
  }

  void signIn(String email, String password, Function onSuccess, Function (String) onSignInError){
    _firebaseAuth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((user) {
        onSuccess();
      }).catchError((err) {
        print('Error: ' + err.toString());
        onSignInError('SignIn fail, please try again');
      });
  }


  _createUser(String userID, String name, String phone, String email, String password, Function onSuccess, Function(String) onRegisterError) {
    // ignore: prefer_collection_literals
    var user= Map<String, String>();
    user['uid'] = userID;
    user['name'] = name;
    user['phone'] = phone;

    // ignore: deprecated_member_use
    var ref = FirebaseDatabase.instance.reference().child('user');
    ref.child(userID).set(user).then((user) => {
      onSuccess()
    }).catchError((err) => {
      onRegisterError('SignUp fail, please try again!')
    });
  }

  void _onSignUpError(String code, Function (String) onRegisterError) {
    print(code);
    switch(code) {
      case 'ERROR_INVALID_EMAIL':
      case 'ERROR_INVALID_CREDETIAL': 
        onRegisterError('Invalid email address'); 
        break;
      case 'ERROR_EMAIL_ALREADY_EXIST':
        onRegisterError('Email already exists');
        break;
      case 'ERROR_WEAK_PASSWORD': 
        onRegisterError('The password is not strong enough');
        break;
      default: 
        onRegisterError('Signup fail, please try again!');
        break;
    }
    
  }
}