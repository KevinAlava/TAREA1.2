import 'package:flutter/material.dart';

class CategoriasZapatos extends StatelessWidget {
  final Function agregarAlCarrito;

  CategoriasZapatos({required this.agregarAlCarrito});

  @override
  Widget build(BuildContext context) {
    final categorias = ['Deportivos', 'Casuales', 'Formales'];
    final zapatos = [
      {'nombre': 'Nike Air', 'categoria': 'Deportivos', 'precio': 100},
      {'nombre': 'Mocasines', 'categoria': 'Formales', 'precio': 80},
      {'nombre': 'Tenis Vans', 'categoria': 'Casuales', 'precio': 70},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Categorías de Zapatos')),
      body: ListView(
        children: categorias.map((categoria) {
          final zapatosCategoria =
          zapatos.where((z) => z['categoria'] == categoria).toList();
          return ExpansionTile(
            title: Text(categoria),
            children: zapatosCategoria.map((zapato) {
              return ListTile(
                title: const Text('Nombre'),
                subtitle: Text('Precio: \$${zapato['precio']}'),
                trailing: ElevatedButton(
                  onPressed: () => agregarAlCarrito(zapato),
                  child: Text('Agregar'),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
