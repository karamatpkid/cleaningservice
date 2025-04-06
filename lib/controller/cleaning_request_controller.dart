import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CleaningRequestController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final hostelController = TextEditingController();
  final roomController = TextEditingController();
  final nameController = TextEditingController();
  final regController = TextEditingController();
  final phoneController = TextEditingController();

  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isSubmitted = false.obs;

  @override
  void onClose() {
    hostelController.dispose();
    roomController.dispose();
    nameController.dispose();
    regController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFF7941D),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      selectedDate.value = date;
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFF7941D),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      selectedTime.value = time;
    }
  }

  Future<void> submitRequest() async {
    if (formKey.currentState!.validate() &&
        selectedDate.value != null &&
        selectedTime.value != null) {
      try {
        isLoading.value = true;
        final requestData = {
          'hostel': hostelController.text,
          'room': roomController.text,
          'name': nameController.text,
          'regNumber': regController.text,
          'phone': phoneController.text,
          'cleaningDate': DateFormat('yyyy-MM-dd').format(selectedDate.value!),
          'cleaningTime': selectedTime.value!.format(Get.context!),
          'timestamp': Timestamp.now(),
          'status': 'pending',
        };

        await FirebaseFirestore.instance
            .collection('cleaningRequests')
            .add(requestData);

        clearForm();
        isSubmitted.value = true;
        Get.back();
        Get.snackbar(
          'Success',
          'Request submitted successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to submit request. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void clearForm() {
    hostelController.clear();
    roomController.clear();
    nameController.clear();
    regController.clear();
    phoneController.clear();
    selectedDate.value = null;
    selectedTime.value = null;
  }
}
