import 'package:flutter/material.dart';

class Carrito extends StatelessWidget {
  final List<Map<String, dynamic>> carrito;

  Carrito({required this.carrito});

  @override
  Widget build(BuildContext context) {
    final total = carrito.fold(
        0, (sum, item) => sum + (item['precio'] as int));

    return Scaffold(
      appBar: AppBar(title: Text('Carrito de Compras')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carrito.length,
              itemBuilder: (context, index) {
                final item = carrito[index];
                return ListTile(
                  title: Text(item['nombre']),
                  subtitle: Text('Precio: \$${item['precio']}'),
                );
              },
            ),
          ),
          Text('Total: \$${total}'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/factura', arguments: carrito);
            },
            child: Text('Generar Factura'),
          ),
        ],
      ),
    );
  }
}
