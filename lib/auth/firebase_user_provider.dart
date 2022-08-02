import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CheckappUsersFirebaseUser {
  CheckappUsersFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CheckappUsersFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CheckappUsersFirebaseUser> checkappUsersFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CheckappUsersFirebaseUser>(
            (user) => currentUser = CheckappUsersFirebaseUser(user));
