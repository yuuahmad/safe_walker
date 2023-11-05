import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:safe_walker/components/card_cctv.dart';
import 'package:safe_walker/pages/detail_card_cctv.dart';
// import 'package:safe_walker/components/profil_user.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final device = database.child("/device");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FirebaseAnimatedList(
        query: device,
        itemBuilder: (context, snapshot, animation, index) {
          if (kDebugMode) {
            print(snapshot.value);
          }
          // return ListTile(
          //   title: Text(snapshot.child('/namaDevice').value.toString()),
          //   subtitle: Text(snapshot.child('/pelanggaran').value.toString()),
          //   trailing: Text(snapshot.child('/id').value.toString()),
          // );
          return CardCctv(
            jikaDitekan: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailCardCctv(namaDevices: snapshot.child('/namaDevice').value.toString())));
              print("detail cctv telah ditekan");
            },
            // snapshot.child('/namaDevice').value.toString(),
            // idDevice: snapshot.value.toString(),
            namaDevice: snapshot.child('/namaDevice').value.toString(),
            pelanggaran: snapshot.child('/pelanggaran').value.toString() == "false" ? false : true,
            urlGambar: snapshot.child('/urlGambar').value.toString(),
          );
        },
      ),
    );
  }
}
