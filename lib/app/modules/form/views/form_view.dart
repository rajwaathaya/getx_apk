import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';
import 'package:image_picker/image_picker.dart';

class FormView extends GetView<FormController> {
  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

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
                color: Color.fromARGB(255, 128, 44, 110),
                fontFamily: 'Poppins Extra Bold',
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image != null
                ? Container(height: 100, width: 100, child: Image.file(image!))
                : Container(),
            Container(
              margin: EdgeInsets.all(20),
              width: double
                  .infinity, // Sesuaikan ukuran gambar sesuai kebutuhan Anda
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
              child: Image.asset(
                'assets/images/OBJECTS.png',
                width: 200,
                height: 100,
              ),
            ),
            SizedBox(height: 3),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(165, 35),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Color.fromARGB(255, 128, 44, 110),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () async {
                await getImage();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Color.fromARGB(255, 128, 44, 110),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Icon(
                    Icons.image,
                    color: Color.fromARGB(255, 128, 44, 110),
                    size: 20,
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(20),
              width: double
                  .infinity, // Sesuaikan ukuran gambar sesuai kebutuhan Anda
              height: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.50),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              padding: EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Information',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins Bold',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 128, 44,
                                110)), // Set the border color to purple
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 128, 44,
                                110)), // Set the border color to purple
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 128, 44,
                                110)), // Set the border color to purple
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 128, 44,
                                110)), // Set the border color to purple
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.infinity, 48),
                    backgroundColor: Color.fromARGB(255, 128, 44, 110),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins Bold',
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 23,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
