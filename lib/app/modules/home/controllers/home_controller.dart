import 'package:get/get.dart';

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}

class HomeController extends GetxController {
  final count = 0.obs;

  // Daftar produk (contoh, Anda dapat menggantinya sesuai kebutuhan Anda)
  final List<Product> products = [
    Product(
      id: 1,
      title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      price: 109.95,
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      category: "Category 1",
      image: "assets/images/product1.png",
      rating: Rating(rate: 3.9, count: 120),
    ),
    Product(
      id: 2,
      title: "Product 2",
      price: 29.99,
      description: "Description for Product 2",
      category: "Category 2",
      image: "assets/images/product2.png",
      rating: Rating(rate: 3.8, count: 75),
    ),
    // Tambahkan produk lain sesuai kebutuhan
    Product(
      id: 3,
      title: "Product 3",
      price: 29.99,
      description: "Description for Product 2",
      category: "Category 2",
      image: "assets/images/product3.png",
      rating: Rating(rate: 3.8, count: 75),
    ),
    // Tambahkan produk lain sesuai kebutuhan
    Product(
      id: 4,
      title: "Product 4",
      price: 29.99,
      description: "Description for Product 2",
      category: "Category 2",
      image: "assets/images/product4.png",
      rating: Rating(rate: 3.8, count: 75),
    ),
    // Tambahkan produk lain sesuai kebutuhan
    Product(
      id: 5,
      title: "Product 5",
      price: 29.99,
      description: "Description for Product 2",
      category: "Category 2",
      image: "assets/images/product5.png",
      rating: Rating(rate: 3.8, count: 75),
    ),
    // Tambahkan produk lain sesuai kebutuhan
    Product(
      id: 6,
      title: "Product 6",
      price: 29.99,
      description: "Description for Product 2",
      category: "Category 2",
      image: "assets/images/product6.png",
      rating: Rating(rate: 3.8, count: 75),
    ),
    // Tambahkan produk lain sesuai kebutuhan
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
