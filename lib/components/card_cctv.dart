// import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:safe_walker/components/gambar_terbaru.dart';
// import 'package:flutter_native_splash/cli_commands.dart';

class CardCctv extends StatefulWidget {
  // final String idDevice;
  final VoidCallback jikaDitekan;
  final String namaDevice;
  final String urlGambar;
  final bool pelanggaran;
  const CardCctv(
      {super.key,
      required this.pelanggaran,
      required this.urlGambar,
      required this.jikaDitekan,
      // required this.idDevice,
      required this.namaDevice});

  @override
  State<CardCctv> createState() => _CardCctvState();
}

class _CardCctvState extends State<CardCctv> {
  final storage = FirebaseStorage.instance.ref();
  // final networkImageUrl = await lokasigambar.getDownloadURL();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: OutlinedButton(
            onPressed: widget.jikaDitekan,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.namaDevice,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 6,
                ),
                ClipRRect(borderRadius: BorderRadius.circular(6), child: GambarTerbaru(namaDevice: widget.namaDevice)),
                // StreamBuilder(stream: lokasigambar.getDownloadURL(), builder: ClipRRect(
                //     borderRadius: BorderRadius.circular(6),
                //     child: Image.network(
                //       lokasigambar.toString(),
                //       height: 150,
                //       width: double.maxFinite,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: widget.pelanggaran
                      ? const Text(
                          "telah terjadi pelanggaran di area ini",
                          style: TextStyle(color: Colors.red),
                        )
                      : const Text(
                          "trotoar digunakan dengan benar",
                        ),
                )
              ],
            )),
      ),
    );
  }
}
