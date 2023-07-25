class Products {
  final String? id;
  final String? createdAt;
  final String? price;
  final String? name;
  final String? description;
  final String? color;
  final String? stock;
  final List<dynamic>? ordersList;

  const Products(
      {this.id,
      this.createdAt,
      this.price,
      this.name,
      this.description,
      this.color,
      this.stock,
      this.ordersList});

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'price': price,
      'name': name,
      'description': description,
      'color': color,
      'stock': stock,
      'ordersList': ordersList
    };
  }

  static Products fromJson(Map<String, Object?> json) {
    return Products(
      id: json['id'] == null ? null : json['id'] as String,
      createdAt: json['createdAt'] == null ? null : json['createdAt'] as String,
      price: json['price'] == null ? null : json['price'] as String,
      name: json['name'] == null ? null : json['name'] as String,
      description:
          json['description'] == null ? null : json['description'] as String,
      color: json['color'] == null ? null : json['color'] as String,
      stock: json['stock'] == null ? null : json['stock'] as String,
      ordersList: json['ordersList'] == null
          ? null
          : json['ordersList'] as List<dynamic>
    );
  }
}
