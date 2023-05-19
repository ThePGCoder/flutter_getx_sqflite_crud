import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/employee_model.dart';
import '../controllers/home_controller.dart';
import 'edit_modal.dart';

class EmployeeCard extends StatelessWidget {
  EmployeeCard({Key? key, required this.employee}) : super(key: key);
  Employee employee;
  final homeController = Get.find<HomeController>();

  @override

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
          ]
        ),
        child: ListTile(
          leading: employee.imageUrl != ""
              ? CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade300,
                  foregroundImage: NetworkImage(employee.imageUrl.toString()))
              : Container(
                  width: 50, child: Icon(Icons.panorama_outlined, size: 35)),
          title: Text(employee.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(employee.role),
              Row(
                children: [
                  GestureDetector(onTap: () {
                    editModal(employee);
                  },child: Icon(Icons.edit_outlined, color: Colors.orange.shade300)),
                  GestureDetector(onTap: (){
                    homeController.deleteEmployee(employee.id);
                    },child: Icon(Icons.delete_forever_outlined, color: Colors.red.shade300,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
