import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Factura extends StatelessWidget {
  final List<Map<String, dynamic>> carrito;

  Factura({required this.carrito});

  Future<void> generarPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Factura', style: pw.TextStyle(fontSize: 24)),
            ...carrito.map(
                  (item) => pw.Text('${item['nombre']} - \$${item['precio']}'),
            ),
            pw.Text(
              'Total: \$${carrito.fold(0, (sum, item) => sum + (item['precio'] as int))}',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/factura.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Factura')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: carrito.map((item) {
                return ListTile(
                  title: Text(item['nombre']),
                  subtitle: Text('Precio: \$${item['precio']}'),
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await generarPDF();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Factura guardada como PDF')),
              );
            },
            child: Text('Guardar PDF'),
          ),
        ],
      ),
    );
  }
}

getApplicationDocumentsDirectory() {
}
