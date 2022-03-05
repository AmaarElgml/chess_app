import 'package:chess_app/model/pojo/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/services/local/cache_helper.dart';
import '../../../../model/services/store.dart';
import 'states.dart';
import '../../home/home_page.dart';
import '../../account/account_page.dart';
import '../../friends/friends_page.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());
  final _store = Store();

  static MainCubit get(context) => BlocProvider.of(context);

  late AppUser currentUser;

  int currentIndex = 0;

  changeCurrentIndex(index) {
    currentIndex = index;
    emit(MainChangeBottomNavState());
  }

  List<String> titles = ['Home', 'Friends', 'Account'];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Friends'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
  ];

  List<Widget> pages = [
    HomePage(),
    FriendsPage(),
    AccountPage(),
  ];

  getCurrentUser() {
    final id = CacheHelper.getData(key: 'userId');
    _store.getUserByID(id).then((user) {
      currentUser = AppUser.fromMap(user.docs.first.data());
    });
  }
}
