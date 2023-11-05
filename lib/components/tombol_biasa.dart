// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';

class TombolSederhana extends StatelessWidget {
  final String judul;
  final VoidCallback ketikaDitekan;
  const TombolSederhana(this.judul, this.ketikaDitekan, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
            onPressed: ketikaDitekan,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  judul.capitalize(),
                ),
                Icon(Icons.arrow_forward)
              ],
            )),
      ),
    );
  }
}
