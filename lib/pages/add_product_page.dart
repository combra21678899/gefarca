import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductPage extends StatelessWidget {
  final code = TextEditingController();
  final name = TextEditingController();
  final stock = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Producto')),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: code, decoration: InputDecoration(labelText: 'Código')),
              TextField(controller: name, decoration: InputDecoration(labelText: 'Nombre')),
              TextField(controller: stock, decoration: InputDecoration(labelText: 'Cantidad')),
              TextField(controller: price, decoration: InputDecoration(labelText: 'Precio')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    Product(
                      code: code.text,
                      name: name.text,
                      stock: int.tryParse(stock.text) ?? 0,
                      price: int.tryParse(price.text) ?? 0,
                    ),
                  );
                },
                child: Text('Guardar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}