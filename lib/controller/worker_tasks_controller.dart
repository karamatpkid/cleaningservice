import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerTasksController extends GetxController {
  final RxList<DocumentSnapshot> tasks = <DocumentSnapshot>[].obs;
  final RxBool isLoading = true.obs;
  final RxString selectedFilter = 'pending'.obs;
  StreamSubscription<QuerySnapshot>? _taskSubscription;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  @override
  void onClose() {
    _taskSubscription?.cancel();
    super.onClose();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading.value = true;

      // Cancel existing subscription
      await _taskSubscription?.cancel();

      // Create the query
      Query query = FirebaseFirestore.instance
          .collection('cleaningRequests')
          .where('status', isEqualTo: selectedFilter.value);

      // Listen to real-time updates
      _taskSubscription = query.snapshots().listen(
        (snapshot) {
          // Sort the documents locally
          final sortedDocs =
              snapshot.docs.toList()..sort((a, b) {
                final aData = a.data() as Map<String, dynamic>;
                final bData = b.data() as Map<String, dynamic>;
                int dateCompare = aData['cleaningDate'].compareTo(
                  bData['cleaningDate'],
                );
                if (dateCompare != 0) return dateCompare;
                return aData['cleaningTime'].compareTo(bData['cleaningTime']);
              });

          tasks.value = sortedDocs;
          isLoading.value = false;
        },
        onError: (error) {
          print('Error fetching tasks: $error');
          isLoading.value = false;
        },
      );
    } catch (e) {
      print('Error in fetchTasks: $e');
      isLoading.value = false;
    }
  }

  void filterTasks(String status) {
    selectedFilter.value = status;
    fetchTasks();
  }

  Future<void> updateTaskStatus(String taskId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('cleaningRequests')
          .doc(taskId)
          .update({
            'status': newStatus,
            'updatedAt': FieldValue.serverTimestamp(),
            if (newStatus == 'completed')
              'completedAt': FieldValue.serverTimestamp(),
          });

      // After updating the status, fetch tasks again with the current filter
      await fetchTasks();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update task status: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
