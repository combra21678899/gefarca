import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/app_data.dart';
import 'edit_product_page.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {

  List<Product> get products => AppData.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProduct = await Navigator.pushNamed(context, '/add');

          if (newProduct != null) {
            setState(() {
              AppData.addProduct(newProduct as Product);
            });
          }
        },
        child: Icon(Icons.add),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔍 BUSCADOR
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // 📦 LISTA DE PRODUCTOS
            Expanded(
              child: products.isEmpty
                  ? Center(child: Text('No hay productos'))
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final p = products[index];

                        return Card(
                          elevation: 3,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(p.name[0]),
                            ),

                            title: Text(p.name),

                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Código: ${p.code}'),
                                Text('Stock: ${p.stock}'),
                                Text('Precio: \$${p.price}'),
                              ],
                            ),

                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                // ✏️ EDITAR
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () async {
                                    final updated = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditProductPage(product: p),
                                      ),
                                    );

                                    if (updated != null) {
                                      setState(() {
                                        int i = products.indexOf(p);
                                        products[i] = updated as Product;
                                      });
                                    }
                                  },
                                ),

                                // 🗑 ELIMINAR
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      AppData.deleteProduct(p);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

