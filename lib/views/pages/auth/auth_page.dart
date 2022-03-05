import 'package:chess_app/app_theme.dart';
import 'package:chess_app/consts.dart';
import 'package:chess_app/model/pojo/user.dart';
import 'package:chess_app/viewmodels/auth_viewmodel.dart';
import 'package:chess_app/views/widgets/background_widget.dart';
import 'package:chess_app/views/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import '../main/main_page.dart';

class AuthPage extends StatefulWidget {
  static String id = 'AuthPage.id';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthViewModel _viewModel = AuthViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
        body: Stack(children: [
          BackgroundWidget(),
          Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(defSpacing * 1.5),
                child: ListView(children: [
                  Image.asset(appLogo, height: 100, color: Colors.grey),
                  SizedBox(height: defSpacing * 2),
                  CustomTextField(
                      hint: 'Email',
                      iconData: Icons.email,
                      onSaved: (email) {
                        _email = email;
                      },
                      inputType: TextInputType.emailAddress),
                  SizedBox(height: defSpacing / 2),
                  CustomTextField(
                      hint: 'Password',
                      iconData: Icons.lock,
                      onSaved: (password) {
                        _password = password;
                      },
                      obscure: true),
                  SizedBox(height: defSpacing / 2),
                  CustomButton(
                      title: isLogin ? 'Login' : 'Register',
                      onPressed: () {
                        isLogin ? _validateSign() : _validateRegister();
                      }),
                  SizedBox(height: defSpacing),
                  Center(child: Text('Or', style: TextStyle(color: Colors.white70, fontSize: 18))),
                  SizedBox(height: defSpacing),
                  SignInButton(Buttons.Google, onPressed: () {
                    _validateGoogleSign();
                  }, padding: EdgeInsets.symmetric(vertical: defSpacing / 4)),
                  SizedBox(height: defSpacing / 2),
                  SignInButton(Buttons.Facebook, onPressed: () {
                    _validateFacebookSign();
                  }, padding: EdgeInsets.symmetric(vertical: defSpacing * 0.75)),
                  SizedBox(height: defSpacing / 2),
                  CustomButton(
                      title: 'Continue as guest',
                      onPressed: () {
                        navigateReplaceTo(context, MainPage.id);
                      },
                      backColor: Colors.grey,
                      titleColor: Colors.black54),
                  SizedBox(height: defSpacing * 1.5),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(isLogin ? 'Don\'t have an account?' : 'Already have an account',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(width: defSpacing / 4),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(isLogin ? 'Register' : 'Login',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)))
                  ])
                ])),
          ),
        ]));
  }

  _validateRegister() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _viewModel.registerWithEmail(_email, _password).then((credential) {
        _viewModel.saveUser(AppUser(id: credential.user!.uid, email: _email));
        navigateReplaceTo(context, MainPage.id);
      }).catchError((error) {
        print('Error in register ${error.toString()}');
        showSnackBar(context, error.toString());
      });
    }
  }

  _validateSign() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _viewModel.loginWithEmail(_email, _password).then((value) {
        _viewModel.saveUserLocally(value.user!.uid);
        navigateReplaceTo(context, MainPage.id);
      }).catchError((error) {
        print('Error in sign ${error.toString()}');
        showSnackBar(context, error.toString());
      });
    }
  }

  _validateGoogleSign() async {
    _viewModel.loginWithGoogle().then((value) {
      _viewModel.saveUserLocally(value.user!.uid);
      navigateReplaceTo(context, MainPage.id);
    }).catchError((error) {
      print('Error in SignGoogle ${error.toString()}');
      showSnackBar(context, error.toString());
    });
  }

  _validateFacebookSign() async {
    _viewModel.loginWithFacebook().then((value) {
      _viewModel.saveUserLocally(value.user!.uid);
      navigateReplaceTo(context, MainPage.id);
    }).catchError((error) {
      print('Error in SignFacebook ${error.toString()}');
      showSnackBar(context, error.toString());
    });
  }
}
