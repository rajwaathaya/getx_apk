import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getx_apk/app/data/model.dart';

class FormView extends GetView<FormController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final FormController formController = Get.put(FormController());
  Product product = Get.arguments ?? Product();

  final items = [
    "Women's Clothes",
    "Women's Shoes",
    "Women's Bags",
    "Men's Clothes",
    "Men's Shoes",
  ];

  File? image;

  // final TextEditingController productNameController = TextEditingController();
  // final TextEditingController productCategoryController =
  //     TextEditingController();
  // late TextEditingController productPriceController = TextEditingController();
  // final TextEditingController productDescriptionController =
  //     TextEditingController();

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
  }

  @override
  Widget build(BuildContext context) {
    // if (product != null) {
    //   productNameController.text = product.title ?? '';
    //   // selectedCategory = product.category ?? '';
    //   productPriceController.text = (product.price ?? 0).toString();
    //   productDescriptionController.text = product.description ?? '';
    // }
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
                  ),
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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          // controller: productNameController,
                          decoration: InputDecoration(
                            labelText: 'Product Name',
                            labelStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 44, 110)),
                        ),
                        SizedBox(height: 15),
                        DropdownButtonFormField(
                          isDense: true,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xfff5f5f5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff802c6e),
                              ),
                            ),
                          ),
                          value: formController.selectedValue.value.isNotEmpty
                              ? formController.selectedValue.value
                              : null,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Color(0xff802c6e),
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            if (value != null) {
                              formController.setSelectedValue(value);
                            }
                          },
                          hint: Text(
                            'Category',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
                          ),
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                          isExpanded: true,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          // controller: productPriceController,
                          decoration: InputDecoration(
                            labelText: 'Price',
                            labelStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 44, 110)),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          maxLines: null,
                          // controller: productDescriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 44, 110)),
                        ),
                      ],
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
