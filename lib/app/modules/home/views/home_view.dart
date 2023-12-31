import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apk/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:getx_apk/app/data/model.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  Product product = Get.arguments ?? Product();

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
              'Fake Store',
              style: TextStyle(
                color: Color.fromARGB(255, 128, 44, 110),
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
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    height: 36,
                    margin: EdgeInsets.only(top: 3),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Product',
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
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

                // FILTER
                Flexible(
                  flex: 3,
                  child: Container(
                    width: 101,
                    height: 36,
                    margin: EdgeInsets.only(top: 3),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Filter',
                        hintStyle: TextStyle(fontFamily: 'Poppins'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        suffixIcon: Icon(Icons.filter_alt_outlined),
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
            child: FutureBuilder(
              future: controller.loadProducts(),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      height: Get.height * 0.8,
                      child: GridView.builder(
                        padding: EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 6.5 / 8.8,
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: controller.listProduct.value.length,
                        itemBuilder: (context, index) {
                          final product = homeController.listProduct[index];

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL,
                                  arguments: controller.listProduct[index]);
                            },
                            child: Container(
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 5)),
                                    Image.network(
                                      product.image ?? '',
                                      height: 100,
                                      width: 70,
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        product.title ?? '',
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins Bold',
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        product.description ?? '',
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${(product.price ?? 0).toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins Bold',
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color.fromARGB(
                                                      255, 255, 215, 0),
                                                  size: 18,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  (product.rating?.rate ?? 0)
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily:
                                                          'Poppins Medium'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),

          //ADD NEW PRODUCT
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.FORM);
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
