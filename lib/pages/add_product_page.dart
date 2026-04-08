import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final code = TextEditingController();
  final name = TextEditingController();
  final stock = TextEditingController();
  final price = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    code.dispose();
    name.dispose();
    stock.dispose();
    price.dispose();
    super.dispose();
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(
        context,
        Product(
          id: DateTime.now().toString(), // Generar ID único
          code: code.text,
          name: name.text,
          stock: int.parse(stock.text),
          price: double.parse(price.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Producto')),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: code,
                    decoration: InputDecoration(labelText: 'Código'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el código';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: stock,
                    decoration: InputDecoration(labelText: 'Cantidad'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la cantidad';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      if (int.parse(value) < 0) {
                        return 'La cantidad no puede ser negativa';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: price,
                    decoration: InputDecoration(labelText: 'Precio'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el precio';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un precio válido';
                      }
                      if (double.parse(value) < 0) {
                        return 'El precio no puede ser negativo';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveProduct,
                    child: Text('Guardar'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}