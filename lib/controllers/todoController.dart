import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/authController.dart';
import 'package:todo/service/database.dart';

class TodoController extends GetxController {
  final auth = Get.find<AuthController>();
  CollectionReference? userTodos;
  DB db = DB();
  late Stream<QuerySnapshot> stream;
  @override
  void onInit() {
    userTodos = db.users.doc('${auth.user?.uid}').collection('todos');
    stream = userTodos!.snapshots();
    super.onInit();
  }

  // Add new todo
  add(String title, String des) async {
    try {
      await db.users.doc(auth.user?.uid).collection("todos").add({
        'title': title,
        'des': des,
        'check': false,
        'date': Timestamp.now().seconds
      });
      Get.snackbar("Added", 'New Todo Added Success',
          snackPosition: SnackPosition.BOTTOM);
      return true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Err", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  // Update Todo
  updateTodo(String tid, String title, String des) {
    try {
      userTodos?.doc(tid).update({'title': title, 'des': des});
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Updating Todo", e.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Delete ToDo Task From DB
  remove(String tid) {
    userTodos?.doc(tid).delete();
  }

  // Set Todo Task is Done
  done(String tid) {
    userTodos?.doc(tid).update({'check': true});
  }

  // Set Todo Task in Progress
  inProgress(String tid) {
    userTodos?.doc(tid).update({'check': false});
  }
}
