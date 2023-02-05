class ProductModel{
  final String id;
  final String title;
  final String description;
  final double price;

  ProductModel({required this.id, required this.title, required this.description, required this.price});
}

final productList = [
  ProductModel(id: '0', title: 'Red T-Shirt', description: 'Ghorar Dim', price: 200),
  ProductModel(id: '1', title: 'Trousers', description: 'Hatir Dim', price: 100),
  ProductModel(id: '3', title: 'Yellow Scarf', description: 'Banorer Dim', price: 50),
  ProductModel(id: '4', title: 'White Cap', description: 'Gorur Dim', price: 30),
];