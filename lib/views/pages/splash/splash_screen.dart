import 'package:chess_app/views/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import '../../../consts.dart';
import '../../../model/services/local/cache_helper.dart';
import '../auth/auth_page.dart';
import '../main/main_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen.id';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      bool isLogged = CacheHelper.getLogged(key: kIsLoggedSP) ?? false;
      if (isLogged)
        Navigator.of(context).pushNamedAndRemoveUntil(MainPage.id, (Route<dynamic> route) => false);
      else
        Navigator.of(context).pushNamedAndRemoveUntil(AuthPage.id, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundWidget(),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(appLogo, color: Colors.grey),
                    radius: 120))),
      ],
    ));
  }
}
