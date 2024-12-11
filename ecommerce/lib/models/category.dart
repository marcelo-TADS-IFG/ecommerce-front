class Category {
  int id;
  String name;

  // Construtor da classe Category
  Category({required this.id, required this.name});

  // Fábrica que cria uma instância de Category a partir de um JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name']);
  }

  // Método que converte uma instância de Category para JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  // Construtor para criar o produto a partir de JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }

  // Método para converter o produto de volta para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
