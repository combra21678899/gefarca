import 'package:flutter/material.dart';
import '../models/product.dart';

class EditProductPage extends StatefulWidget {
  final Product product;
  const EditProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController stockController;
  late TextEditingController priceController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController(text: widget.product.code);
    nameController = TextEditingController(text: widget.product.name);
    stockController = TextEditingController(text: widget.product.stock.toString());
    priceController = TextEditingController(text: widget.product.price.toString());
  }

  @override
  void dispose() {
    codeController.dispose();
    nameController.dispose();
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      if (!mounted) return;
      Navigator.pop(
        context,
        Product(
          id: widget.product.id,
          code: codeController.text,
          name: nameController.text,
          stock: int.parse(stockController.text),
          price: double.parse(priceController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Producto')),
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
                    controller: codeController,
                    decoration: InputDecoration(labelText: 'Código'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el código';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: stockController,
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
                    controller: priceController,
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
                    child: Text('Guardar Cambios'),
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