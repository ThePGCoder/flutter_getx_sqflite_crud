import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/employee_model.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_new_modal.dart';
import '../widgets/employee_card.dart';

class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/sqflite.png', height: 40),
              Image.asset('assets/images/getx.png', height: 40),
            ],
          ),
          centerTitle: true,
        ),
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade50,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle_outlined,
                    color: Colors.blue, size: 30),
                Container(width: 5),
                Text(
                  'Employees CRUD',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.grey.shade50,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return homeController.employeeList.isEmpty
                  ? Center(child: Text('Please enter some employees.'))
                  : SingleChildScrollView(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: homeController.employeeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Employee employee =
                                (homeController.employeeList)[index];
                            return EmployeeCard(employee: employee);
                          }));
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNewModal();
          },
          child: Icon(Icons.add),
        ));
  }
}
