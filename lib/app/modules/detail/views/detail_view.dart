import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_apk/app/routes/app_pages.dart';

import '../controllers/detail_controller.dart';
import 'package:getx_apk/app/data/model.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  Product product = Get.arguments ?? Product();
  @override
  Widget build(BuildContext context) {
    // final Product product = controller.products[0];
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
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 340,
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.50),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),

            //TITLE
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  product.title ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins Medium',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  for (var i = 0; i < 5; i++)
                    Icon(
                      Icons.star,
                      color: i < ((product.rating?.rate ?? 0).round())
                          ? Color.fromARGB(255, 255, 217, 0)
                          : Colors.grey,
                      size: 17,
                    ),
                  SizedBox(width: 5),
                  Text(
                    '${product.rating?.rate} (${product.rating?.count} ratings)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '\$${(product.price ?? 0).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins Medium',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 17),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Product Details',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins Medium',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  product.description ?? '',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Container(
                  width: 119,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Color.fromARGB(255, 128, 44, 110),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sell_rounded,
                          color: Color.fromARGB(255, 128, 44, 110),
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text(
                          product.category ?? '',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color:
                                Color.fromARGB(255, 128, 44, 110), // Warna teks
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //EDIT
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.FORM, arguments: product);
            },
            backgroundColor: Color.fromARGB(255, 255, 217, 0),
            child: Icon(Icons.edit),
          ),

          //DIALOG HAPUS
          SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 202, 32, 35),
            onPressed: () {
              // Tampilkan dialog konfirmasi untuk menghapus
              Get.dialog(
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 250,
                    height: 280,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Color(0xffF2D2EB),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: Icon(
                                  Icons.help_outline_outlined,
                                  color: Color.fromARGB(255, 128, 44,
                                      110), // Warna ikon atas (putih)
                                  size: 70,
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'Are you sure?',
                                style: TextStyle(
                                  fontFamily: 'Poppins Bold',
                                  color: Color(0xff802c6e),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'Do you really want to delete this product? You will not be able to undo this action!',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xff802c6e),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff802c6e),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size(100, 15),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Color(0xff802c6e),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff802c6e),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size(100, 15),
                                  ),
                                  onPressed: () {
                                    controller.deleteProduct(product);
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
