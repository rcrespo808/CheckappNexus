import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CheckappNexusFirebaseUser {
  CheckappNexusFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

CheckappNexusFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CheckappNexusFirebaseUser> checkappNexusFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CheckappNexusFirebaseUser>(
            (user) => currentUser = CheckappNexusFirebaseUser(user));
