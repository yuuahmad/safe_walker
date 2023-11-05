import 'package:flutter/material.dart';
import 'package:safe_walker/chatgpt/chatgpt_storage.dart';

class DetailCardCctv extends StatefulWidget {
  final String namaDevices;
  const DetailCardCctv({super.key, required this.namaDevices});

  @override
  State<DetailCardCctv> createState() => _DetailCardCctvState();
}

class _DetailCardCctvState extends State<DetailCardCctv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.namaDevices),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: [
          Text(widget.namaDevices),
          Text("selamat datang pada halaman ${widget.namaDevices}"),
          ChatGptStorage(namaDevice: widget.namaDevices)
        ]),
      ),
    );
  }
}
