import 'package:get/get.dart';

import '../controller/cleaning_request_controller.dart';
import '../controller/request_history_controller.dart';
import '../controller/splash_controller.dart';
import '../controller/worker_tasks_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: true);
    //CleaningRequestController
    Get.put<CleaningRequestController>(
      CleaningRequestController(),
      permanent: true,
    );
    //RequestHistoryController
    Get.put<RequestHistoryController>(
      RequestHistoryController(),
      permanent: true,
    );
    Get.put<WorkerTasksController>(WorkerTasksController(), permanent: true);
  }
}
