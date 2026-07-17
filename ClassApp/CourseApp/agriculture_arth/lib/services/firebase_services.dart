import 'package:agriculture_arth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SIGNUP
 Future<UserModel?> signUp({
  required String email,
  required String password,
  required String role,
  required String name, // ✅ ADD THIS
}) async {
  try {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel user = UserModel(
      uid: cred.user!.uid,
      email: email,
      role: role,
      name: name, // ✅ ADD
    );

    await _firestore.collection("users").doc(user.uid).set(user.toMap());

    return user;
  } catch (e) {
    print(e);
    return null;
  }
}

  // LOGIN
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc =
          await _firestore.collection("users").doc(cred.user!.uid).get();

      if (!doc.exists) return null;

      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}