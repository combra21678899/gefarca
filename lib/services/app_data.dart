import '../models/product.dart';

class AppData {
  static List<Product> products = [
    Product(
      id: '1', 
      code: '000023', 
      name: 'Acetaminofen', 
      stock: 0, 
      price: 1000.0,
    ),
    Product(
      id: '2', 
      code: '000024', 
      name: 'Dolex', 
      stock: 0, 
      price: 2700.0,
    ),
  ];

  static List<Map<String, String>> history = [];

  static void addProduct(Product product) {
    products.add(product);
    history.add({
      'date': DateTime.now().toString(),
      'product': product.name,
      'action': 'Agregado',
    });
  }

  static void deleteProduct(Product product) {
    products.remove(product);
    history.add({
      'date': DateTime.now().toString(),
      'product': product.name,
      'action': 'Eliminado',
    });
  }
}