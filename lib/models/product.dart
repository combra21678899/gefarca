class Product {
  final String id;
  final String code;
  final String name;
  final int stock;
  final double price;
  
  Product({
    required this.id,
    required this.code,
    required this.name,
    required this.stock,
    required this.price,
  });

  // 🔁 Convertir de Map a objeto (útil para futuro backend)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? DateTime.now().toString(),
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      stock: map['stock'] ?? 0,
      price: (map['price'] ?? 0).toDouble(),
    );
  }

  // 🔁 Convertir de objeto a Map (útil para guardar datos)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'stock': stock,
      'price': price,
    };
  }

  // 🧠 Copiar producto (útil para editar sin modificar original)
  Product copyWith({
    String? id,
    String? code,
    String? name,
    int? stock,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, code: $code, name: $name, stock: $stock, price: $price)';
  }
}