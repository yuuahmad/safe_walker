// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatistikSingkat extends StatelessWidget {
  const StatistikSingkat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        width: double.infinity,
        height: 105,
        child: OutlinedButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Statistik Singkat",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  "Jumlah Devices : 12",
                ),
                Text(
                  "Jumlah Pelanggan : 0",
                ),
                Text(
                  "Perangkat Error : 0",
                ),
                Text(
                  "Terakhir Maintenance : 12 juni 2023",
                ),
              ],
            )),
      ),
    );
  }
}
