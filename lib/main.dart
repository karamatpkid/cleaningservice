import 'package:cleaningservice/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cleaning Service',
      // Add localization configuration
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3

        fontFamily: 'Roboto', // Optional: Set a custom font if needed
      ),

      // Fallback locale
      getPages: AppRoutes.appRoutes(),
    );
  }
}
