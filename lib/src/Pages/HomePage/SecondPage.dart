import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Pages/HomePage/tabs/Bike.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEB7608),
          title: const Text('Tabs navigation'),
          bottom: const TabBar(tabs: [

            Tab(
              icon: Icon(Icons.directions_bike),
            ),


          ]),
        ),
        body: const TabBarView(children: [
          

          Bike(),


        ],)
      ),
    );
  }
}