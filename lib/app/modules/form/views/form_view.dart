import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getx_apk/app/data/model.dart';
import 'package:file_picker/file_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    controller.modelToController(product);
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
        child: Obx(
          () => Column(
            children: [
              Center(
                  child:
                      // imgPick != ''
                      //     ? Container(
                      //         height: 100,
                      //         width: 100,
                      //         child: Image.file(File(imgPick)),
                      //       )
                      Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
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
                          child:
                              // product.image != null
                              //     ? Image.network(product.image ?? '')
                              //     :
                              controller.image.value.path == ''
                                  ? Image.asset(
                                      'assets/images/OBJECTS.png',
                                      width: 200,
                                      height: 100,
                                    )
                                  : Image.file(controller.image.value))),

              //UPLOAD IMAGE
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
                onPressed: () {
                  controller.imagePicker();
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
                width: double.infinity,
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
                padding:
                    EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                child: SingleChildScrollView(
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
                            //NAME
                            TextFormField(
                              controller: controller.titleC,
                              validator: (value) => value == null || value == ''
                                  ? 'This field is required'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Product Name',
                                labelStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 15),
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

                            //CATEGORY
                            SizedBox(height: 15),
                            TextFormField(
                              controller: controller.categoryC,
                              validator: (value) => value == null || value == ''
                                  ? 'This field is required'
                                  : null,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color(0xff802c6e)),
                              decoration: InputDecoration(
                                hintText: 'Category',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
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
                                suffixIcon: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    onChanged: (String? newValue) {
                                      // Update the selected category.
                                      controller.categoryC.text =
                                          newValue ?? '';
                                    },
                                    items: items.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xff802c6e))),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),

                            //PRICE
                            SizedBox(height: 15),
                            TextFormField(
                              controller: controller.priceC,
                              validator: (value) => value == null || value == ''
                                  ? 'This field is required'
                                  : controller.checkIsDouble(value) == false
                                      ? 'Wrong Value'
                                      : null,
                              decoration: InputDecoration(
                                labelText: 'Price',
                                labelStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 15),
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

                            //DESC
                            SizedBox(height: 15),
                            TextFormField(
                              maxLines: null,
                              controller: controller.descriptionC,
                              validator: (value) => value == null || value == ''
                                  ? 'This field is required'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                labelStyle: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 15),
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
              ),

              //SUBMIT
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 48),
                      backgroundColor: Color.fromARGB(255, 128, 44, 110),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    formKey.currentState?.validate() == true
                        ? await controller.storeProduct(
                            product, (product.id != null) ? true : false)
                        : Get.snackbar('Error', 'Data tidak valid');
                  },
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
      ),
    );
  }
}
