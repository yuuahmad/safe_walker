import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BardStorage extends StatefulWidget {
  @override
  _BardStorageState createState() => _BardStorageState();
}

class _BardStorageState extends State<BardStorage> {
  late Future<List<String>> images;

  @override
  void initState() {
    super.initState();
    images = FirebaseStorage.instance
        .ref()
        .child('device1')
        .listAll()
        .then((result) => result.items.map((e) => e.name).toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: images,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          print(snapshot.data!.toString());
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              print(FirebaseStorage.instance
                  .ref()
                  .child('device1')
                  .child(snapshot.data![index])
                  .getDownloadURL()
                  .toString());
              // return ListTile(
              //   title: Text(snapshot.data![index]),
              // );
              return ListTile(
                title: Text(snapshot.data![index]),
                leading: Image.network(
                  FirebaseStorage.instance
                      .ref()
                      .child('device1')
                      .child(snapshot.data![index])
                      .getDownloadURL()
                      .toString(),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              );
            },
          );
        } else {
          return Center(child: Text('No images found'));
        }
      },
    );
  }
}
