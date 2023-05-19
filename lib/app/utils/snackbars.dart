import 'package:flutter/material.dart';
import 'package:get/get.dart';

void messageWithError(error) {
  Get.snackbar('Error', error.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.cancel_sharp, color: Colors.white));
}

void unexpectedError() {
  Get.snackbar('Error', 'There was an unepected error.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.cancel_sharp, color: Colors.white));
}

