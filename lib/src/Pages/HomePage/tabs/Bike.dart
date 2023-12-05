import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/firebase_service.dart';

class Bike extends StatefulWidget {
  const Bike({Key? key}) : super(key: key);

  @override
  _BikeState createState() => _BikeState();
}

class _BikeState extends State<Bike> {
  final FirebaseService firebaseService = FirebaseService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Navegar a otra ruta cuando se presione el botón
              Navigator.pushNamed(context, '/');
            },
            child: Text('Pagina Principal'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navegar a otra ruta cuando se presione el botón
              Navigator.pushNamed(context, '/firstPage');
            },
            child: Text('Agregar Usuario'),
          ),
          SizedBox(height: 20),
          Text('Agregar Usuario:'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Correo'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Agregar usuario a Firebase
                    await firebaseService.addUser(
                      nameController.text,
                      emailController.text,
                    );

                    // Limpiar los controladores después de agregar el usuario
                    nameController.clear();
                    emailController.clear();
                  },
                  child: Text('Agregar'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text('Usuarios desde Firebase:'),
          FutureBuilder<List<String>>(
            future: firebaseService.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<String> users = snapshot.data ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(users[index]),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
