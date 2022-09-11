//for all firebase related services for user
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  String users = 'users';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Create User
  Future<void> createUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection(users).doc(id).set(values);
  }

  //Update User Data
  Future<void> updateUserData(String id, Map<String, dynamic> values) async {
    await _firestore.collection(users).doc(id).update(values);
  }
}
