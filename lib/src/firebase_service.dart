import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String name, String email) async {
    try {
      await usersCollection.add({
        'name': name,
        'email': email,
      });
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<List<String>> getUsers() async {
    List<String> users = [];
    try {
      QuerySnapshot querySnapshot = await usersCollection.get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        users.add('Name: ${data['name']}, Email: ${data['email']}');
      }
    } catch (e) {
      print('Error getting users: $e');
    }
    return users;
  }
}
