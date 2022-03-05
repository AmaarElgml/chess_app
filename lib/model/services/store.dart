import 'package:chess_app/model/pojo/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'local/cache_helper.dart';
import '../../consts.dart';

class Store {
  final _store = FirebaseFirestore.instance;

  saveUser(AppUser user) async {
    await _store.collection(kUsersCollection).add(user.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserByID(id) async {
    return await _store.collection(kUsersCollection).where('id', isEqualTo: id).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsersWith(query) {
    return _store
        .collection(kUsersCollection)
        .where('email', isGreaterThanOrEqualTo: query, isLessThan: query + 'z')
        .get();
  }

  addNewFriend(userID, friendID) async {
    await _store.collection(kUsersCollection).where('id', isEqualTo: userID).get().then((value) {
      value.docs.forEach((element) {
        final AppUser user = AppUser.fromMap(element.data());
        user.friends?.add(friendID);
        _store.collection(kUsersCollection).doc(element.id).update(user.toMap());
      });
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserFriends(userID) async {
    return await _store.collection(kUsersCollection).where('id', isEqualTo: userID).get();
  }
}
