import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GambarTerbaru extends StatelessWidget {
  final String namaDevice;
  const GambarTerbaru({super.key, required this.namaDevice});

  // Future<String> getImageUrls() async {
  //   String imageUrls = '';
  //   try {
  //     // Mendapatkan referensi ke Firebase Storage
  //     Future<String> storageRef = FirebaseStorage.instance.ref(namaDevice).child('/gambar.jpg').getDownloadURL();

  //     imageUrls = storageRef as String;
  //     print(imageUrls);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  //   return imageUrls;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseStorage.instance.ref(namaDevice).child('/gambar.jpg').getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final imageUrl = snapshot.data;
          return Image.network(
            imageUrl!,
            width: double.maxFinite, // Sesuaikan ukuran gambar sesuai kebutuhan Anda
            height: 200,
            fit: BoxFit.cover, // Sesuaikan dengan cara tampilan gambar Anda
          );
        }
      },
    );
  }
}
