import 'package:flutter/material.dart';
import 'package:safe_walker/chatgpt/bard_storage.dart';
import 'package:safe_walker/chatgpt/chatgpt_storage.dart';
import 'package:safe_walker/components/gambar_terbaru.dart';
import 'package:safe_walker/pages/cobaBaca.dart';
import 'package:safe_walker/pages/coba_baca_saya.dart';
import 'package:safe_walker/pages/coba_storage.dart';
import 'package:safe_walker/pages/coba_storage_5bulan.dart';
import 'package:safe_walker/pages/devices.dart';
import 'package:safe_walker/pages/home.dart';
import 'package:safe_walker/pages/notif.dart';
import 'package:safe_walker/pages/profile.dart';

class WraperUtama extends StatefulWidget {
  final String title;

  const WraperUtama({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<WraperUtama> createState() => _WraperUtamaState();
}

class _WraperUtamaState extends State<WraperUtama> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // NavigationBar Example
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 1000),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: 'Devices',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Notif',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        //backgroundColor: Colors.blue,
        //elevation: 10,
        //surfaceTintColor: Colors.lime,
        //height: 20,
        //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      body: <Widget>[
        Home(),
        Devices(),
        GambarTerbaru(
          namaDevice: 'deviceA',
        ),
        Profile()
      ][currentPageIndex],
    );
  }
}
