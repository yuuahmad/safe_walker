import 'package:flutter/cupertino.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Belum Ada Notifikasi"),
    );
  }
}
