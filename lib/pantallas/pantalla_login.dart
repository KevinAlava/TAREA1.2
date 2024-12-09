import 'package:flutter/material.dart';
import 'package:login_usuario/pantallas/pantalla_bienvenida.dart';
import '../logica/logica_login.dart';

class PantallaLogin extends StatefulWidget {
  @override
  PantallaLoginState createState() => PantallaLoginState();
}

class PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  final LogicaLogin logicaLogin = LogicaLogin();

  String mensaje = '';

  void iniciarSesion() {
    final usuario = _usuarioController.text; // Acceder al texto del controlador
    final contrasenia = _contraseniaController.text; // Acceder al texto del controlador

    if (logicaLogin.verificarCredenciales(usuario, contrasenia)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaBienvenida(usuario: usuario),
        ),
      );
    } else {
      setState(() {
        mensaje = 'Usuario o contraseña incorrecta';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C5364), Color(0xFF203A43), Color(0xFF0F2027)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20), // Se corrigió 'EdgeInset' a 'EdgeInsets'
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
                SizedBox(height: 20.0), // Se agregó un punto y coma
                // Campo para el usuario
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white54,
                    ),
                    hintText: 'Usuario',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0),
                // Campo para la contraseña
                TextFormField(
                  controller: _contraseniaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white54,
                    ),
                    hintText: 'Contraseña',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:  BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),

                ElevatedButton(
                  onPressed: iniciarSesion,
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.white,
                   foregroundColor: Colors.blue,
                   padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  child: Text('Iniciar Sesion'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
