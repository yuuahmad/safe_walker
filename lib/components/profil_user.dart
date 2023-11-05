// import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/cli_commands.dart';
import 'package:safe_walker/auth.dart';
import 'package:safe_walker/main.dart';
import 'dart:developer';

const placeholderImage = 'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

class ProfilUser extends StatefulWidget {
  const ProfilUser({super.key});

  @override
  State<ProfilUser> createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  late User user;
  String? photoURL;
  bool isLoading = false;
  late TextEditingController controller;
  bool showSaveButton = false;

  @override
  void initState() {
    user = auth.currentUser!;
    controller = TextEditingController(text: user.displayName);
    controller.addListener(_onNameChanged);
    auth.userChanges().listen((event) {
      if (event != null && mounted) {
        setState(() {
          user = event;
        });
      }
    });
    log(user.toString());
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_onNameChanged);
    super.dispose();
  }

  void _onNameChanged() {
    setState(() {
      if (controller.text == user.displayName || controller.text.isEmpty) {
        showSaveButton = false;
      } else {
        showSaveButton = true;
      }
    });
  }

  /// Map User provider data into a list of Provider Ids.
  List get userProviders => user.providerData.map((e) => e.providerId).toList();
  Future updateDisplayName() async {
    await user.updateDisplayName(controller.text);
    setState(() {
      showSaveButton = false;
    });
    // ignore: use_build_context_synchronously
    ScaffoldSnackbar.of(context).show('Name updated');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        width: double.infinity,
        height: 170,
        child: OutlinedButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Informasi Pengguna",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.displayName ?? "Nama Pengguna",
                        ),
                        Text(user.email ?? user.phoneNumber ?? 'User'),
                        Text(user.uid),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: NetworkImage(
                          user.photoURL ?? placeholderImage,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Future<String?> getPhotoURLFromUser() async {
    String? photoURL;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New image Url:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {
                photoURL = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                photoURL = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return photoURL;
  }
}
