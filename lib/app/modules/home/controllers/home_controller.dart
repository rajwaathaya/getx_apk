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
      title: "Product 1",
      price: 19.99,
      description: "Description for Product 1",
      category: "Category 1",
      image: "image_url_1",
      rating: Rating(rate: 4.5, count: 100),
    ),
    Product(
      id: 2,
      title: "Product 2",
      price: 29.99,
      description: "Description for Product 2",
      category: "Category 2",
      image: "image_url_2",
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
