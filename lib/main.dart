import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  HomeController homeController = Get.put(HomeController());

  WidgetsFlutterBinding.ensureInitialized();
  await homeController.initDb();
  await homeController.fetchAllEmployees();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employees CRUD',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.plusJakartaSansTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
