import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaBienvenida extends StatelessWidget {
  final String usuario;

  PantallaBienvenida({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIENVENIDOS'),
        backgroundColor: Color(0xFF203A56),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOLA, $usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
