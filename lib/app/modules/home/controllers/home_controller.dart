import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/employee_model.dart';
import '../../../utils/snackbars.dart';

class HomeController extends GetxController {
  RxList employeeList = <Employee>[].obs;

  var nameC = TextEditingController();
  var roleC = TextEditingController();
  var imageUrlC = TextEditingController();

  Database? db;

  Future<void> initDb() async {
    if (db != null) {
      return;
    } else {
      try {
        String path = '${await getDatabasesPath()}employees.db';
        db =
            await openDatabase(path, version: 1, onCreate: (db, version) async {
          await db.execute(
              'CREATE TABLE employees (id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING, role STRING, image_url STRING)');
        });
      } catch (error) {
        messageWithError(error);
      }
    }
  }

  Future<void> fetchAllEmployees() async {
    try {
      final data = await db!.query('employees');
      employeeList.clear();
      for (var employee in (data as List)) {
        employeeList.add(Employee(
            id: employee['id'],
            name: employee['name'],
            role: employee['role'],
            imageUrl: employee['image_url']));
      }
      update();
    } catch (error) {
      messageWithError(error);
    }
  }

  Future<void> editEmployee(int id) async {
    try {
      await db!.update(
          'employees',
          ({
            'name': nameC.text,
            'role': roleC.text,
            'image_url': imageUrlC.text
          }),
          where: 'id=?',
          whereArgs: [id]);
      await fetchAllEmployees();
      Get.back();
    } catch (error) {
      messageWithError(error);
    }
  }

  Future<void> addEmployee() async {
    try {
      await db!.insert('employees', {
        'name': nameC.text,
        'role': roleC.text,
        'image_url': imageUrlC.text
      });
    } catch (error) {
      messageWithError(error);
    }
    clearTextControllers();
    await fetchAllEmployees();
    Get.back();
  }

  clearTextControllers() {
    nameC.clear();
    roleC.clear();
    imageUrlC.clear();
  }

  Future deleteEmployee(int id) async {
    Get.defaultDialog(
      radius: 8,
      title: 'Warning',
      middleText: 'Do you want to delete?',
      actions: [
        ElevatedButton(
          onPressed: () async {
            try {
              await db!.delete('employees', where: 'id=?', whereArgs: [id]);
            } catch (error) {
              messageWithError(error);
            }

            await fetchAllEmployees();
            Get.back();
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('No'),
        ),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
