import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class User extends StatefulWidget {
  const User({Key? key});

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  void _agregarUsuario() async {
     await Firebase.initializeApp();  // Inicializar Firebase
    String nombre = _nombreController.text;
    String email = _emailController.text;
    String telefono = _telefonoController.text;

    // Guardar los datos en Firebase
    await FirebaseFirestore.instance.collection('Usuarios').add({
      'nombre': nombre,
      'email': email,
      'telefono': telefono,
    });

    // Limpiar los campos después de guardar
    _nombreController.clear();
    _emailController.clear();
    _telefonoController.clear();

    // Mostrar un mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Usuario agregado con éxito'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Agregar Usuario'),
          SizedBox(height: 20),
          TextFormField(
            controller: _nombreController,
            decoration: InputDecoration(labelText: 'Nombre'),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: _telefonoController,
            decoration: InputDecoration(labelText: 'Teléfono'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _agregarUsuario,
            child: Text('Guardar Usuario'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/SecondPage');
            },
            child: Text('Usuarios registrados'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text('Página Principal'),
          ),
        ],
      ),
    );
  }
}
