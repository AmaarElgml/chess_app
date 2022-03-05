import 'package:chess_app/views/pages/auth/auth_page.dart';
import 'package:chess_app/views/pages/game/game_page.dart';
import 'package:chess_app/views/pages/home/home_page.dart';
import 'package:chess_app/views/pages/main/main_page.dart';
import 'package:chess_app/views/pages/search/search_page.dart';
import 'package:chess_app/views/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final String appLogo = 'assets/chess.png';
final String defImage = 'https://graph.facebook.com/467773731722563/picture';
final String kUserIDSP = 'userId';
final String kIsLoggedSP = 'isLoggedIn';

final String kUsersCollection = 'Users';
final String kUserID = 'id';
final String kUsername = 'username';
final String kUserEmail = 'email';
final String kUserImage = 'image';
final String kUserRating = 'rating';
final String kUserFriends = 'friends';
final String kUserRequests = 'requests';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  SplashScreen.id: (context) => SplashScreen(),
  AuthPage.id: (context) => AuthPage(),
  MainPage.id: (context) => MainPage(),
  HomePage.id: (context) => HomePage(),
  GamePage.id: (context) => GamePage(),
  SearchPage.id: (context) => SearchPage(),
};

void navigateTo(context, route) {
  Navigator.pushNamed(context, route);
}

void navigateReplaceTo(context, route) {
  Navigator.pushReplacementNamed(context, route);
}

void showSnackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text.toString())));
}
