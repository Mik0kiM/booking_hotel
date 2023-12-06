import 'package:booking_hotel/Controllers/AuthController.dart';
import 'package:booking_hotel/Controllers/DatabaseController.dart';
import 'package:booking_hotel/Controllers/NotificationHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Routes/AppPages.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();
  Get.put(DatabaseController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController _authController = Get.put(AuthController()); // Buat instance AuthController
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: _authController.isLoggedIn.value ? '/home' : '/login', // Set initial route based on login status
        getPages: AppRoutes.pages,
        debugShowCheckedModeBanner: false,
    );
  }
}