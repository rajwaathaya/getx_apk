import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
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
                    'assets/images/OBJECTS.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
