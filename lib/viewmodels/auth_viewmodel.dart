import 'package:chess_app/model/pojo/user.dart';
import 'package:chess_app/model/services/auth.dart';
import 'package:chess_app/model/services/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../consts.dart';
import '../model/services/local/cache_helper.dart';

class AuthViewModel {
  final Auth _auth = Auth();
  final Store _store = Store();

  Future<UserCredential> loginWithEmail(email, password) async {
    return await _auth.login(email, password);
  }

  Future<UserCredential> registerWithEmail(email, password) async {
    return await _auth.createUser(email, password);
  }

  saveUser(AppUser user) {
    _store.saveUser(user);
    saveUserLocally(user.id);
  }

  saveUserLocally(id) async {
    await CacheHelper.setLogged(key: kIsLoggedSP, data: true);
    await CacheHelper.setData(key: kUserIDSP, data: id);
  }

  Future<UserCredential> loginWithGoogle() async {
    return await _auth.loginWithGoogle();
  }

  loginWithFacebook() async {
    return await _auth.loginWithFacebook();
  }
}
