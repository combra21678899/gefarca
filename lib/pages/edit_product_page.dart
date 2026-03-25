import 'package:flutter/material.dart';
import '../models/product.dart';

class EditProductPage extends StatefulWidget {
  final Product product;

  const EditProductPage({required this.product});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController stockController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();

    // Inicializar con datos actuales del producto
    codeController = TextEditingController(text: widget.product.code);
    nameController = TextEditingController(text: widget.product.name);
    stockController =
        TextEditingController(text: widget.product.stock.toString());
    priceController =
        TextEditingController(text: widget.product.price.toString());
  }

  @override
  void dispose() {
    codeController.dispose();
    nameController.dispose();
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void saveProduct() {
    final updatedProduct = Product(
      code: codeController.text,
      name: nameController.text,
      stock: int.tryParse(stockController.text) ?? 0,
      price: int.tryParse(priceController.text) ?? 0,
    );

    Navigator.pop(context, updatedProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Editar producto',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Código
                TextField(
                  controller: codeController,
                  decoration: InputDecoration(
                    labelText: 'Código',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10),

                // Nombre
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10),

                // Stock
                TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cantidad',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10),

                // Precio
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                // Botones
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: saveProduct,
                        child: Text('Guardar'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
