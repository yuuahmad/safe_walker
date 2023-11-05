import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:safe_walker/components/card_cctv.dart';
import 'package:safe_walker/components/profil_user.dart';
import 'package:safe_walker/components/statistik_singkat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:safe_walker/pages/detail_card_cctv.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final database = FirebaseDatabase.instance.ref();

  Widget build(BuildContext context) {
    final device = database.child("/device");

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            // Text("isiDataFirebase"),
            ProfilUser(),
            StatistikSingkat(),
            FirebaseAnimatedList(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              query: device.orderByChild("/pelanggaran").limitToLast(2),
              itemBuilder: (context, snapshot, animation, index) {
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
                  // idDevice: snapshot.child('/id').value.toString(),
                  namaDevice: snapshot.child('/namaDevice').value.toString(),
                  pelanggaran: snapshot.child('/pelanggaran').value.toString() == "false" ? false : true,
                  urlGambar: snapshot.child('/urlGambar').value.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
