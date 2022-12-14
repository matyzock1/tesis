import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ClinicasScreen extends StatelessWidget {
  const ClinicasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'PET-SOS CLÍNICAS',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: const Color.fromARGB(255, 135, 6, 6),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/fondo.jpg'))),
          child: Center(
            child: Column(
              children: [
                Lottie.asset(
                  'assets/gps.json',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Selecciona el tipo de Atención:',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'mapa');
                  },
                  child: const Text(
                    "  CLÍNICAS 24 HORAS  ",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(30),
                      backgroundColor: const Color.fromARGB(255, 135, 6, 6)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'googlemaps');
                  },
                  child: const Text(
                    "CLÍNICAS HR NORMAL",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(30),
                      backgroundColor: const Color.fromARGB(255, 179, 91, 36)),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
