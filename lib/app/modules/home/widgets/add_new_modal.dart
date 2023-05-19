import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'custom_field.dart';

void addNewModal() {
  final homeController = Get.find<HomeController>();
  Get.defaultDialog(
    title: "Add New Employee",
    titlePadding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
    radius: 8,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomField(
            label: 'Name',
            icon: Icons.short_text,
            textController: homeController.nameC,
          ),
          CustomField(
              label: 'Role',
              icon: Icons.badge_outlined,
              textController: homeController.roleC),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: homeController.imageUrlC,
              decoration: (const InputDecoration(
                  prefixIcon: Icon(Icons.panorama_outlined),
                  labelText: "Image Url",
                  border: OutlineInputBorder())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
            child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      homeController.addEmployee();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16),
                    ))),
          )
        ],
      ),
    ),
  );
}
