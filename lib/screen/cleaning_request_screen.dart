import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cleaning_request_controller.dart';
import 'package:intl/intl.dart';

class CleaningRequestScreen extends GetView<CleaningRequestController> {
  const CleaningRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFF7941D),
              const Color(0xFFF7941D).withOpacity(0.8),
              const Color(0xFFF7941D).withOpacity(0.6),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Animated background circles
              ...List.generate(
                5,
                (index) => Positioned(
                  top: [50.0, -30.0, 250.0, 400.0, 500.0][index],
                  right: [20.0, 250.0, -50.0, 200.0, -30.0][index],
                  child: Container(
                    width: [120.0, 150.0, 180.0, 130.0, 160.0][index],
                    height: [120.0, 150.0, 180.0, 130.0, 160.0][index],
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              // Main Content
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                      const SizedBox(height: 20),

                      // Title
                      const Text(
                        'Room Cleaning\nRequest',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Form Fields
                      _buildInputField(
                        'Hostel Name',
                        controller.hostelController,
                        Icons.home,
                      ),
                      _buildInputField(
                        'Room Number',
                        controller.roomController,
                        Icons.meeting_room,
                      ),
                      _buildInputField(
                        'Your Name',
                        controller.nameController,
                        Icons.person,
                      ),
                      _buildInputField(
                        'Registration Number',
                        controller.regController,
                        Icons.numbers,
                      ),
                      _buildInputField(
                        'Phone Number',
                        controller.phoneController,
                        Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),

                      // Date and Time Pickers
                      Obx(
                        () => _buildDateTimePicker(
                          'Select Date',
                          controller.selectedDate.value != null
                              ? DateFormat(
                                'yyyy-MM-dd',
                              ).format(controller.selectedDate.value!)
                              : null,
                          Icons.calendar_today,
                          () => controller.pickDate(context),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => _buildDateTimePicker(
                          'Select Time',
                          controller.selectedTime.value?.format(context),
                          Icons.access_time,
                          () => controller.pickTime(context),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Submit Button
                      Center(
                        child: Obx(
                          () =>
                              controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : ElevatedButton(
                                    onPressed: controller.submitRequest,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFFF7941D),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.check),
                                        SizedBox(width: 8),
                                        Text(
                                          'Submit Request',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType? keyboardType,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(icon, color: const Color(0xFFF7941D)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        validator:
            (value) => value?.isEmpty == true ? 'This field is required' : null,
      ),
    );
  }

  Widget _buildDateTimePicker(
    String label,
    String? value,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFF7941D)),
            const SizedBox(width: 15),
            Text(
              value ?? label,
              style: TextStyle(
                color: value != null ? Colors.black87 : Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
