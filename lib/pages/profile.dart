import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safe_walker/components/profil_user.dart';
import 'package:safe_walker/main.dart';
import 'package:safe_walker/components/tombol_biasa.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            ProfilUser(),
            TombolSederhana("Pengaturan Perangkat", () => null),
            TombolSederhana("Pengaturan Notifikasi", () => null),
            TombolSederhana("Edit Informasi Akun", () => null),
            TombolSederhana("Privasi", () => null),
            TombolSederhana("Tentang Aplikasi", () => null),
            TombolSederhana("Ganti Akun", () => null),
            TombolSederhana("Keluar Akun", () => _keluar()),
          ],
        ),
      ),
    );
  }

  /// Example code for sign out.
  Future<void> _keluar() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }
}
