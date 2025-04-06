import 'package:cleaningservice/routes/routes_name.dart';
import 'package:cleaningservice/screen/splash_screen.dart';
import 'package:cleaningservice/screen/worker_tasks_screen.dart';
import 'package:get/get.dart';

import '../app_binding/app_binding.dart';
import '../controller/worker_tasks_controller.dart';
import '../screen/cleaning_request_screen.dart';
import '../screen/request_history_screen.dart';
import '../screen/role_selection_screen.dart';
import '../screen/student_dashboard_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      binding: AppBinding(),
    ),
    //RoleSelectionScreen
    GetPage(
      name: RoutesName.roleSelectionScreen,
      page: () => RoleSelectionScreen(),
    ),
    //StudentDashboardScreen
    GetPage(
      name: RoutesName.studentDashboardScreen,
      page: () => StudentDashboardScreen(),
    ),
    //CleaningRequestScreen
    GetPage(
      name: RoutesName.cleaningRequestScreen,
      page: () => CleaningRequestScreen(),
    ),
    //RequestHistoryScreen
    GetPage(
      name: RoutesName.requestHistoryScreen,
      page: () => RequestHistoryScreen(),
    ),
    //WorkerTasksController
    GetPage(
      name: RoutesName.workerTasksScreen,
      page: () => WorkerTasksScreen(),
    ),
  ];
}
