import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String username;
  final String uid;

  const User({
    required this.email,
    required this.username,
    required this.uid,
  });

  //cambiar cualquier info que necesitamos a objeto
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      email: snapshot['email'],
      uid: snapshot['uid'],
    );
  }
}
