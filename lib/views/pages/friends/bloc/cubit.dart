import 'package:chess_app/model/pojo/user.dart';
import 'package:chess_app/views/pages/friends/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/services/local/cache_helper.dart';
import '../../../../model/services/store.dart';

class FriendsCubit extends Cubit<FriendsStates> {
  FriendsCubit() : super(FriendsInitialState());

  static FriendsCubit get(context) => BlocProvider.of(context);
  final _store = Store();

  List<AppUser> search = [];
  List<AppUser> friends = [];

  void clearSearch() {
    search.clear();
  }

  void clearFriends() {
    friends.clear();
  }

  searchForFriend(String text) {
    emit(GetSearchLoadingState());
    search = [];
    return _store.getAllUsersWith(text).then((value) {
      clearSearch();
      value.docs.forEach((element) {
        search.add(AppUser.fromMap(element.data()));
      });
      emit(GetSearchSuccessState());
    }).catchError((error) {
      emit(GetSearchErrorState(error.toString()));
    });
  }

  addFriend(friendID) {
    final userID = CacheHelper.getData(key: 'userId');
    _store.addNewFriend(userID, friendID);
    _store.addNewFriend(friendID, userID);
  }

  getFriends() {
    friends.clear();
    final userID = CacheHelper.getData(key: 'userId');
    emit(GetFriendsLoadingState());
    _store.getUserFriends(userID).then((value) {
      final AppUser user = AppUser.fromMap(value.docs.first.data());
      user.friends?.forEach((friendID) async {
        _store.getUserFriends(friendID).then((value) {
          friends.add(AppUser.fromMap(value.docs.first.data()));
        });
      });
    });
  }
}
