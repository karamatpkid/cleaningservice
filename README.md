# Cleaning Service App

Welcome to the Cleaning Service App, a Flutter-based application designed to streamline room cleaning requests and task management for students and workers. The app is built using modern Flutter architecture and integrates Firebase for backend services.

## Features

- **Role-Based Navigation**: Separate dashboards for students and workers with role-specific functionalities.
- **Student Features**:
  - Create room cleaning requests with details like hostel name, room number, and preferred date/time.
  - View request history and track cleaning progress.
- **Worker Features**:
  - View assigned cleaning tasks with filters (Pending, In Progress, Completed).
  - Update task status and log task completion.
- **Modern UI/UX**: Beautiful Material 3 design with custom animations and gradients for a smooth user experience.
- **Firebase Integration**: Real-time database for storing and retrieving requests and tasks.

## Screens

- **Splash Screen**: Animated splash screen with a welcoming design.
- **Role Selection Screen**: Choose between Student and Worker roles.
- **Student Dashboard**:
  - Create new cleaning requests.
  - View and track request history.
- **Worker Dashboard**:
  - View and manage cleaning tasks by status.
  - Update task progress in real-time.
- **Cleaning Request Form**: A detailed form for students to submit cleaning requests.
- **Request History**: View detailed history of past cleaning requests.
- **Worker Tasks**: Manage tasks assigned to workers with real-time updates.

## Technologies Used

- **Flutter**: Cross-platform mobile framework.
- **Firebase**: Backend service for authentication, real-time data storage, and analytics.
- **GetX**: State management and navigation.
- **Cloud Firestore**: Database for storing cleaning requests and tasks.

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/cleaning-service-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd cleaning-service-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Set up Firebase:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Add Android and/or iOS apps to your Firebase project.
   - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) file and place it in the appropriate directory:
     - `android/app/` for `google-services.json`
     - `ios/Runner/` for `GoogleService-Info.plist`
   - Update the `android/build.gradle` and `android/app/build.gradle` files as per Firebase setup instructions.

5. Run the app:
   ```bash
   flutter run
   ```

## Folder Structure

```
lib/
├── app_binding/
│   ├── app_binding.dart
├── controller/
│   ├── cleaning_request_controller.dart
│   ├── request_history_controller.dart
│   └── splash_controller.dart
│   └── worker_tasks_controller.dart
├── routes/
│   ├── app_routes.dart
│   └── routes_name.dart
├── screens/
│   ├── cleaning_request_screen.dart
│   ├── request_history_screen.dart
│   ├── role_selection_screen.dart
│   ├── splash_screen.dart
│   ├── student_dashboard_screen.dart
│   └── worker_tasks_screen.dart
├── utils/
│   ├── app_colors.dart
└── main.dart
```

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add new feature"
   ```
4. Push to your branch:
   ```bash
   git push origin feature-name
   ```
5. Create a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Thank you for using the Cleaning Service App! If you have any questions or feedback, feel free to open an issue or contribute to the project.
