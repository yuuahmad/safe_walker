// import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CobaBacaSaya extends StatefulWidget {
  const CobaBacaSaya({super.key});

  @override
  State<CobaBacaSaya> createState() => _CobaBacaSayaState();
}

class _CobaBacaSayaState extends State<CobaBacaSaya> {
  // String teksFirebase = "teks akan tampil disini";
  final database = FirebaseDatabase.instance.ref();
  // late StreamSubscription _namaStreamSubscription;
  // final device = database.child("/device");

  @override
  Widget build(BuildContext context) {
    final device = database.child("/device");

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Belum Ada CobaBacaSayaikasi"),
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

// dikomen karena mengganggu dan ada di tempat lain
        // Expanded(
        //   child: FirebaseAnimatedList(
        //     query: device,
        //     itemBuilder: (context, snapshot, animation, index) {
        //       // return ListTile(
        //       //   title: Text(snapshot.child('/namaDevice').value.toString()),
        //       //   subtitle: Text(snapshot.child('/pelanggaran').value.toString()),
        //       //   trailing: Text(snapshot.child('/id').value.toString()),
        //       // );
        //       return CardCctv(
        //         // snapshot.child('/namaDevice').value.toString(),
        //         pelanggaran: snapshot.child('/pelanggaran').value.toString() == "false" ? false : true,
        //         urlGambar: snapshot.child('/urlGambar').value.toString(),
        //       );
        //     },
        //   ),
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
    );
  }
}
