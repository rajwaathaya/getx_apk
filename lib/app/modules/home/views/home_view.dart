import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apk/app/modules/detail/views/detail_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Rajwa Store',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins Extra Bold',
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SEACRH
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 373,
                    height: 36,
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Product',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                // FILTER
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 101,
                    height: 36,
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Filter',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: Icon(Icons.filter_list),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CARD
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final product = homeController.products[index];

                return Container(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Image.asset(
                          product.image,
                          width: 90,
                          height: 50,
                        ),
                        SizedBox(height: 10), // Jarak antara gambar dan judul
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize:
                                18, // Sesuaikan ukuran teks sesuai kebutuhan Anda
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  product.rating.rate.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika ketika tombol "Add Product" ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 128, 44, 110),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(190, 40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Add New Product",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
