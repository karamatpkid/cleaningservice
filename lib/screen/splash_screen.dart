import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../utils/app_colors.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kPrimaryColor,
              kPrimaryColor.withOpacity(0.8),
              kPrimaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background animated circles
              Positioned(
                right: -50,
                top: Get.height * 0.1,
                child: Obx(
                  () => AnimatedOpacity(
                    opacity: controller.logoOpacity.value * 0.5,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -30,
                bottom: Get.height * 0.15,
                child: Obx(
                  () => AnimatedOpacity(
                    opacity: controller.logoOpacity.value * 0.3,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
              // Main Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Obx(
                    () => AnimatedSlide(
                      offset: Offset(0, controller.logoOpacity.value - 1),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        opacity: controller.logoOpacity.value,
                        duration: const Duration(seconds: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // App Icon with shadow
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.cleaning_services,
                                size: 60,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(height: 24),
                            // App Name with custom styling
                            ShaderMask(
                              shaderCallback:
                                  (bounds) => LinearGradient(
                                    colors: [
                                      kBlackColor,
                                      kBlackColor.withOpacity(0.8),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                              child: const Text(
                                "CleanIT",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Tagline
                            Text(
                              "Making Cleaning Smarter",
                              style: TextStyle(
                                fontSize: 16,
                                color: kBlackColor.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
