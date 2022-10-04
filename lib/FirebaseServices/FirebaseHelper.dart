import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/views/home_screen.dart';
import 'package:my_portfolio/widgets/opening_chat.dart';

class FirebaseHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference profile = firestore.collection('Profile');
  static CollectionReference skills = firestore.collection('skills');
  static CollectionReference projects = firestore.collection('projects');
  static CollectionReference chats = firestore.collection('chats');
  static CollectionReference user = firestore.collection('users');

  adduser(String userName, String email,String token) async {
    CollectionReference result = chats.doc(email.toString()).collection(email);

    MyDialog(Get.context!, email);
    return result.add({
      'name': userName,
      'email': email,
      'joinedAt': DateTime.now(),
      'tokens':token,
    }).whenComplete(() => user
        .add({'name': userName, 'email': email, 'joinedAt': DateTime.now()}));
  }

  static addMessage(String collectionName, String messages) async {
    CollectionReference result =
        chats.doc(collectionName).collection(collectionName);
    return result
        .add({'sender': 1, 'message': messages, 'dateTime': DateTime.now()});
  }

  static Future<void> updateTokens(String token,String email,String docID) async {
    await FirebaseHelper.chats
        .doc(email)
        .collection(email)
        .doc(docID)
        .update({'token': token});
  }
}
