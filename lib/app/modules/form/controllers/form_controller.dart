import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_apk/app/data/model.dart';
import 'package:getx_apk/app/data/service_api.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();
  Rx<File> image = File('').obs;

  Future imagePicker() async {
    try {
      final imagePick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) {
        return;
      }
      final imageTemp = File(imagePick.path);
      image.value = imageTemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  // final Rx<Product> product = Get.arguments ?? Product();

  TextEditingController titleC = TextEditingController();
  TextEditingController categoryC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    titleC.text = product.title ?? '';
    categoryC.text = product.category ?? '';
    priceC.text = (product.price ?? '').toString();
    descriptionC.text = product.description ?? '';
  }

  controllerToModel(Product product) {
    product.title = titleC.text;
    product.category = categoryC.text;
    product.price = double.tryParse(priceC.text);
    return Product;
  }

  Future storeProduct(Product product, bool isUpdate) async {
    try {
      product = controllerToModel(product);
      isUpdate == false
          ? await serviceApi.createProduct(product)
          : await serviceApi.updateProduct(product);
      Get.back();
      Get.snackbar('Success', 'Product berhasil disimpan');
    } catch (e) {
      print(e.toString());
    }
  }

  var selectedValue = ''.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  final List<Product> products = [
    Product(
      id: 1,
      title: "Ribbed Top",
      price: 11.99,
      description:
          "Short top in ribbed viscose jersey. Collar, V-neck opening at front, and long sleeves.",
      category: "Women's Clothes",
      image: "assets/images/product1.png",
      rating: Rating(rate: 4.6, count: 88),
    ),
    Product(
      id: 2,
      title: "Air Jordan 1 Elevate High",
      price: 151.49,
      description:
          "Classic Jordan style reaches new heights in this lifted AJ-1. The platform stance and high-top collar make a statement, while crisp leather and flashy finishes make these kicks the winning assist your outfit needs. For added flex, the puffy, stitched-on Wings logo delivers big (and just wait until you feel the ultra-comfortable Air cushioning underfoot). Go ahead, elevate your game.",
      category: "Women's Shoes",
      image: "assets/images/product2.png",
      rating: Rating(rate: 4.6, count: 13),
    ),
    Product(
      id: 3,
      title: "Medium Ava Strap Bag In Smooth Calfskin",
      price: 23.00,
      description:
          "Removable and Adjustable Strap With a Minimum Drop 9 in (24 CM) and Maximum Drop 14 in (35 CM)",
      category: "Women's Bag",
      image: "assets/images/product3.png",
      rating: Rating(rate: 3.8, count: 75),
    ),
    Product(
      id: 4,
      title: "Meladyan Women Los Angeles Tshirt",
      price: 20.99,
      description:
          "Cute los angeles and california city Letters printed t shirts for womens is vintage and casual style. They are crewneck, classic short sleeves, basic loose fit top, drop shoulder to make of such t-shirt. Stylish and new in better.",
      category: "Women's Clothes",
      image: "assets/images/product4.png",
      rating: Rating(rate: 4.6, count: 824),
    ),
    Product(
      id: 5,
      title: "Standard Midweight Zip Hoodie",
      price: 41.25,
      description:
          "A classic slightly oversized zip hoodie made from a soft cotton and recycled polyester blend fleece jersey. It has a double layered drawstring hood, slightly dropped shoulders, a sturdy front zipper, ribbed finishes and a soft a soft fleecy inside. Size S measures 116 cm in chest circumference, 73 cm in length, and 63 cm in sleeve length.",
      category: "Men's Clothes",
      image: "assets/images/product5.png",
      rating: Rating(rate: 4.8, count: 9),
    ),
    Product(
      id: 6,
      title: "Nike Air Force 1 '07 LV8",
      price: 130,
      description:
          "With an aged aesthetic and classic colors, the hoops original gets a vintage makeover. Weathered canvas and suede bring the hook-shot look of old-school basketball into crisp fall days, while the Coconut Milk outsole adds an artisan finish. Pair it with jeans, joggers or whatever else—the timeless look is the perfect match for any outfit.",
      category: "Men's Shoes",
      image: "assets/images/product6.png",
      rating: Rating(rate: 4.6, count: 11),
    ),
  ];

  final count = 0.obs;
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
