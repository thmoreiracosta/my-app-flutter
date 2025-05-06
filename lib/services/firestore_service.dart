import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';

class FirestoreService {
  Stream<List<Post>> getPosts() {
    return FirebaseFirestore.instance.collection('posts').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Post.fromMap(doc.data())).toList());
  }
}
