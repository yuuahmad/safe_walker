// import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:safe_walker/chatgpt/chatgpt_storage.dart';
import 'package:safe_walker/components/card_cctv.dart';
import 'package:safe_walker/services/Storage.dart';

class CobaStorage extends StatefulWidget {
  const CobaStorage({super.key});

  @override
  State<CobaStorage> createState() => _CobaStorageState();
}

class _CobaStorageState extends State<CobaStorage> {
  // String teksFirebase = "teks akan tampil disini";
  final database = FirebaseDatabase.instance.ref();
  late Future<String> imageURL;
  // late StreamSubscription _namaStreamSubscription;
  // final device = database.child("/device");
  @override
  void initState() {
    super.initState();
    imageURL = FirebaseStorage.instance.ref().child('device1').child('gambar.jpg').getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    final device = database.child("/device");
    // final Storage storage = Storage();

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Belum Ada CobaStorageikasi"),
          ElevatedButton(
              onPressed: () {
                print("tombol telah ditekan");
                device.set({'nama': "ahmad yusuf maulana"});
              },
              child: Text("update data, hapus lainnya")),
          ElevatedButton(
              onPressed: () {
                print("tombol telah ditekan");
                device.update({'umur': "12 tahun"});
              },
              child: Text("update data yang penting saja")),
          ElevatedButton(
              onPressed: () {
                print("tombol telah ditekan");
                device.child('/nama').remove();
              },
              child: Text("hapus data")),

          // ChatGptStorage(),

          FutureBuilder<String>(
            future: imageURL,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Center(
                  child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                );
              } else {
                return Center(child: Text('No image found'));
              }
            },
          ),

          // FutureBuilder(
          //     future: FirebaseStorage.instance.ref('device1').listAll(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         print(snapshot.data!.toString());
          //         return Text(snapshot.data!.items[1].name);
          //       }
          //       return Text('default tempat url gambar');
          //     }),

// dikomen karena ada ditempat lain dan hanya sebagai percobaan
          // FirebaseAnimatedList(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   query: device,
          //   itemBuilder: (context, snapshot, animation, index) {
          //     // return ListTile(
          //     //   title: Text(snapshot.child('/namaDevice').value.toString()),
          //     //   subtitle: Text(snapshot.child('/pelanggaran').value.toString()),
          //     //   trailing: Text(snapshot.child('/id').value.toString()),
          //     // );
          //     return CardCctv(
          //       snapshot.child('/namaDevice').value.toString(),
          //       pelanggaran: snapshot.child('/pelanggaran').value.toString() == "false" ? false : true,
          //       urlGambar: snapshot.child('/urlGambar').value.toString(),
          //     );
          //   },
          // ),

          // StreamBuilder(
          //     stream: device.onValue.listen((event) {}),
          //     builder: (context, snapshot) {
          //       final tilesList = <ListTile>[];
          //       if (snapshot.hasData) {
          //         print(snapshot.data.toString());
          //         final Map<String, dynamic> deviceSaya = (snapshot.data!) as Map<String, dynamic>;
          //         deviceSaya.forEach((key, value) {
          //           final deviceSelanjutnya = Map<String, dynamic>.from(value);
          //           final deviceTile = ListTile(
          //             leading: Icon(Icons.person),
          //             title: Text(deviceSelanjutnya['namaDevice']),
          //             subtitle: Text(deviceSelanjutnya['pelanggaran']),
          //           );
          //           tilesList.add(deviceTile);
          //         });
          //       }
          //       return ListView(
          //         children: tilesList,
          //       );
          //     }),

          // Text(teksFirebase),
          // ElevatedButton(
          //     onPressed: () {
          //       _aktifkanPendengar();
          //     },
          //     child: Text("update? mungkin"))
        ],
      ),
    );
  }
}
