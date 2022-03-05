import 'package:chess_app/views/pages/friends/bloc/cubit.dart';
import 'package:chess_app/views/pages/main/bloc/cubit.dart';
import 'package:chess_app/views/pages/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme.dart';
import 'consts.dart';
import 'model/services/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  Firebase.initializeApp().whenComplete(() {
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageReceived);
  });
  CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => MainCubit()), BlocProvider(create: (context) => FriendsCubit())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          routes: appRoutes,
          initialRoute: SplashScreen.id,
        ));
  }
}

Future<void> _firebaseBackgroundMessageReceived(RemoteMessage message) async {
  print("Notification: ${message.notification?.title} - ${message.notification?.body}");
}
