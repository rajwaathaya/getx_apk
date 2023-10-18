import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Product product = controller.products[0];
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
                width: 340, // Sesuaikan ukuran gambar sesuai kebutuhan Anda
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
                    ]), // Sesuaikan ukuran gambar sesuai kebutuhan Anda
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 50),
              child: Text(
                product.title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins Medium',
                  fontWeight: FontWeight.bold,
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
                      color: i < (product.rating.rate.round())
                          ? Color.fromARGB(255, 255, 217, 0)
                          : Colors.grey,
                      size: 17,
                    ),
                  SizedBox(
                      width: 5), // Memberi jarak antara ikon bintang dan teks
                  Text(
                    '${product.rating.rate} (${product.rating.count} ratings)',
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
                  '\$${product.price.toStringAsFixed(2)}',
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
                  product.description,
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
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons
                                .label, // Icon label (sesuaikan dengan ikon yang Anda inginkan)
                            color: Color.fromARGB(
                                255, 128, 44, 110), // Warna ikon label
                            size: 13, // Sesuaikan ukuran ikon
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          product.category,
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Arahkan ke halaman form dengan data produk yang akan diedit
              // Get.to(() => FormView(product: product));
            },
            backgroundColor: Color.fromARGB(255, 255, 217, 0),
            child: Icon(Icons.edit),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 202, 32, 35),
            onPressed: () {
              // Tampilkan dialog konfirmasi untuk menghapus
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.purple, // Warna atas (ungu)
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.question_answer,
                                color: Colors.white, // Warna ikon atas (putih)
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white, // Warna bawah (putih)
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "Are you Sure?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Do you really want to delete this product? You will not be able to undo this action!',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: TextButton(
                                        onPressed: () {
                                          // Tambahkan logika untuk menghapus produk
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              Colors.green, // Warna tombol "Ya"
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Radius kotak
                                          ),
                                        ),
                                        child: Text(
                                          "Ya",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors
                                              .red, // Warna tombol "Batal"
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Radius kotak
                                          ),
                                        ),
                                        child: Text(
                                          "Batal",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
