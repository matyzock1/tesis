// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  String nombredeUsuario = '';

  User? user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  DocumentReference userName = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  _signOut() async {
    await _firebaseAuth.signOut();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    DocumentReference authResult =
        FirebaseFirestore.instance.collection('users').doc(user?.uid);
    DocumentSnapshot docSnap = await authResult.get();
    var data = docSnap.data() as Map<String, dynamic>;
    nombredeUsuario = data['username'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'PET-SOS',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _signOut();
            },
            child: const Text(
              "Cerrar sesión",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: const Color.fromARGB(255, 135, 6, 6),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Lottie.network(
            'https://lottie.host/983f7e2e-074d-4dae-9002-b37a9d34892b/cKUkzO90yt.json',
            width: 130,
            height: 130,
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<DocumentSnapshot>(
            future: userName.get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Algo salió mal");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("No existe un nombre de usuario");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                  "Bienvenido: ${data['username']}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                );
              }

              return const Text("loading");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'splash2');
              },
              icon: const Icon(Icons.announcement_rounded),
              label: const Text("Consultar Estado"),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  fixedSize: const Size(300, 80),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  primary: const Color.fromARGB(255, 135, 6, 6),
                  onPrimary: Colors.white,
                  elevation: 15,
                  shape: const StadiumBorder()),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'splash3');
              },
              icon: const Icon(Icons.fmd_good_sharp),
              label: const Text("Geolocalización"),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  fixedSize: const Size(300, 80),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  primary: const Color.fromARGB(255, 135, 6, 6),
                  onPrimary: Colors.white,
                  elevation: 15,
                  shape: const StadiumBorder()),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'splash5');
              },
              icon: const Icon(Icons.add_chart),
              label: const Text("Consultas Previas"),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  fixedSize: const Size(300, 80),
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  primary: const Color.fromARGB(255, 135, 6, 6),
                  onPrimary: Colors.white,
                  elevation: 15,
                  shape: const StadiumBorder()),
            ),
          ),
        ],
      ),
    );
  }
}