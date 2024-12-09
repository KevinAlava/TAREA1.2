import 'package:flutter/material.dart';
import 'pantallas/categorias_zapatos.dart';
import 'pantallas/carrito.dart';
import 'pantallas/factura.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> carrito = [];

    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/': (context) => PantallaLogin(),
        '/categorias': (context) => CategoriasZapatos(
          agregarAlCarrito: (zapato) {
            carrito.add(zapato);
          },
        ),
        '/carrito': (context) => Carrito(carrito: carrito),
        '/factura': (context) => Factura(carrito: carrito),
      },
    );
  }
}

class LogicaLogin {
  bool verificarCredenciales(String usuario, String contrasenia) {
    const usuarioValido = "admin";
    const contraseniaValida = "12345";

    return usuario == usuarioValido && contrasenia == contraseniaValida;
  }
}

class PantallaLogin extends StatefulWidget {
  @override
  _PantallaLoginState createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  final LogicaLogin _logicaLogin = LogicaLogin();

  String _mensajeError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Inicia sesión para continuar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Usuario",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _contraseniaController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    final usuario = _usuarioController.text;
                    final contrasenia = _contraseniaController.text;

                    if (_logicaLogin.verificarCredenciales(usuario, contrasenia)) {
                      Navigator.pushReplacementNamed(context, '/categorias');
                    } else {
                      setState(() {
                        _mensajeError = "Credenciales incorrectas";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                if (_mensajeError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      _mensajeError,
                      style: const TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
