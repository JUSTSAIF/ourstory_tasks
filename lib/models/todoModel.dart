import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String id, title, des, cDate;
  late bool done;

  TodoModel(this.id, this.title, this.des, this.cDate, this.done);

  TodoModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    print(documentSnapshot);
    id = documentSnapshot.id;
    title = (documentSnapshot.data() as Map)["title"].toString();
    des = (documentSnapshot.data() as Map)["des"].toString();
    cDate = (documentSnapshot.data() as Map)["cDate"].toString();
    done = (documentSnapshot.data() as Map)["done"];
  }
}
