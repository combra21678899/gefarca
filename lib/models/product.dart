class Product {
  String code;
  String name;
  int stock;
  int price;

  Product({
    required this.code,
    required this.name,
    required this.stock,
    required this.price,
  });

  // 🔁 Convertir de Map a objeto (útil para futuro backend)
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      stock: map['stock'] ?? 0,
      price: map['price'] ?? 0,
    );
  }

  // 🔁 Convertir de objeto a Map (útil para guardar datos)
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'stock': stock,
      'price': price,
    };
  }

  // 🧠 Copiar producto (útil para editar sin modificar original)
  Product copyWith({
    String? code,
    String? name,
    int? stock,
    int? price,
  }) {
    return Product(
      code: code ?? this.code,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'Product(code: $code, name: $name, stock: $stock, price: $price)';
  }
}

