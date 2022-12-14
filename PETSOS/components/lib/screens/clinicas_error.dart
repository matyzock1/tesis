import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ClinicasErrorScreen extends StatefulWidget {
  const ClinicasErrorScreen({Key? key}) : super(key: key);

  @override
  State<ClinicasErrorScreen> createState() => _ClinicasErrorScreenState();
}

class _ClinicasErrorScreenState extends State<ClinicasErrorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.warning,
                    color: Color.fromARGB(255, 255, 0, 81),
                    size: 25.0,
                  ),
                  const Text(
                    ' Error!',
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ],
              ),
              content: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'No encontramos una enfermedad asociada a los Sintomas introducidos. Revisa de todas maneras las clinicas cercanas!',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0))),
                  ],
                ),
              ));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
