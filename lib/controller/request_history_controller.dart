import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestHistoryController extends GetxController {
  final RxList<DocumentSnapshot> requests = <DocumentSnapshot>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRequests();
  }

  Future<void> fetchRequests() async {
    try {
      isLoading.value = true;

      // Listen to real-time updates
      FirebaseFirestore.instance
          .collection('cleaningRequests')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((snapshot) {
        requests.value = snapshot.docs;
        isLoading.value = false;
      }, onError: (error) {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Failed to fetch requests: $error',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      });
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Failed to fetch requests: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  String getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return '#FFA500'; // Orange
      case 'in_progress':
        return '#1E90FF'; // Blue
      case 'completed':
        return '#32CD32'; // Green
      case 'cancelled':
        return '#FF0000'; // Red
      default:
        return '#808080'; // Grey
    }
  }
}