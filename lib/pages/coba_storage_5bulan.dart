import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CobaStorageBulan extends StatefulWidget {
  const CobaStorageBulan({super.key});

  @override
  State<CobaStorageBulan> createState() => CobaStorageBulanState();
}

class CobaStorageBulanState extends State<CobaStorageBulan> {
  // late String imageUrl;
  // final storage = FirebaseStorage.instance;

  // void initstate() {
  //   super.initState();
  //   imageUrl = '';
  //   getImageUrl();
  // }

  // Future<void> getImageUrl() async {
  //   final url = await FirebaseStorage.instance.ref().child("device1/gambar.png").getDownloadURL().then((value) {
  //     setState(() {
  //       imageUrl = value;
  //       print(value.toString());
  //     });
  //   });
  // final ref = storage.ref().child('device1/gambar.jpg');
  // final url = ref.getDownloadURL();
  // url.getDownloadURL().then((value) {
  //   print(value.toString());
  //   setState(() {
  //     imageUrl = value;
  //   });
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.network(getImageUrls() as String),
        Text("coba dapatkan url dari tombol"),
        // Image(
        //   image: NetworkImage(imageUrl),
        //   fit: BoxFit.cover,
        //   height: 100,
        //   width: double.maxFinite,
        // ),
        ElevatedButton(
          onPressed: () async {
            await FirebaseStorage.instance
                .ref()
                .child("device1/gambar.jpg")
                .getDownloadURL()
                .then((value) => print(value));
          },
          child: Text("print image url"),
        )
      ],
    ));
  }
}

Future getImageUrls() async {
  // List<String> imageUrls = [];
  String imageurls = await FirebaseStorage.instance.ref().child("device1/gambar.jpg").getDownloadURL().then((value) {
    print(value);
    return value;
  });

  return imageurls;

  // try {
  //   // Mendapatkan referensi ke Firebase Storage
  //   final Reference storageRef = FirebaseStorage.instance.ref('device1');

  //   // Daftar semua item di dalam folder
  //   final ListResult result = await storageRef.listAll();

  //   // Mengambil URL semua item
  //   for (final Reference ref in result.items) {
  //     final imageUrl = await ref.getDownloadURL();
  //     imageUrls.add(imageUrl);
  //     print(imageUrls);
  //   }
  // } catch (e) {
  //   print('Error: $e');
  // }
}
