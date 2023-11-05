import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  // final String referensi;
  // Storage(this.referensi);

  final storage = FirebaseStorage.instance.ref();

  Future<ListResult> listfiles(String referensi) async {
    ListResult result = await storage.child(referensi).listAll();

    result.items.forEach((element) {
      print("ditemukan file $element");
    });
    return result;
  }
}
