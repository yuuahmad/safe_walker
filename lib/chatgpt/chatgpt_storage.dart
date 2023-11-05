import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatGptStorage extends StatelessWidget {
  final String namaDevice;
  const ChatGptStorage({super.key, required this.namaDevice});

  Future<List<String>> getImageUrls() async {
    List<String> imageUrls = [];
    try {
      // Mendapatkan referensi ke Firebase Storage
      final Reference storageRef = FirebaseStorage.instance.ref(namaDevice);

      // Daftar semua item di dalam folder
      final ListResult result = await storageRef.listAll();

      // Mengambil URL semua item
      for (final Reference ref in result.items) {
        final imageUrl = await ref.getDownloadURL();
        imageUrls.add(imageUrl);
        print(imageUrls);
      }
    } catch (e) {
      print('Error: $e');
    }
    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getImageUrls(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<String> imageUrls = snapshot.data!;
          print(imageUrls.toString());
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 400,
                ),
              );
            },
          );
        }
      },
    );
  }
}
