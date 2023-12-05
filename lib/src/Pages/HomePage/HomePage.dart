import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Pages/HomePage/tabs/Car.dart';
import 'package:flutter_application_1/src/Pages/HomePage/tabs/Bike.dart';
import 'package:flutter_application_1/src/Pages/HomePage/FirstPage.dart'; // Importa la vista FirstVista.dart

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 137, 8, 235),
          title: const Text('Bienvenidos'),
          bottom: const TabBar(tabs: [

            Tab(
              icon: Icon(Icons.directions_car),
            ),
            
          ]),
          actions: [
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(context, '/firstPage'); // Navegar a la vista FirstVista.dart
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            
            Car(),
  
          ],
        ),
      ),
    );
  }
}
