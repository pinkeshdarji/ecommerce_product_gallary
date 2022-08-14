class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  int quantity;

  Product({required this.id, required this.name, required this.image, required this.price, this.quantity = 0});
}
