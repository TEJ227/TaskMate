# TaskMate - TejasGujar

A Mini Task Management App - Submission by Tejas Gujar
**TaskMate** is a lightweight, responsive task management Flutter application that lets users create, manage, and track tasks efficiently. The app follows MVVM architecture with clean code structure and uses Hive for local persistence.

## Features

- View a list of tasks (grouped by Pending & Completed)
- Add new tasks with title, description, and due date
- Mark tasks as completed or pending
- Delete tasks
- View task details in a dedicated screen
- Responsive design for mobile/tablets
- Dark/Light Mode toggle
- Persist data locally using Hive
- MVVM architecture with Provider for state management

## Getting Started

This project is a starting point for a Flutter application.

1. **Clone the repository:**

```bash
git clone https://github.com/TEJ227/TaskMate
cd taskmate-tg
```
2. **Install dependencies:**

```bash
flutter pub get
```

3. **Generate Hive Adapters:**

```bash
flutter packages pub run build_runner build
```

4. **Run the app:**
```
flutter run
```
Note: On Android, make sure INTERNET permission is added to AndroidManifest.xml.


# State Management

This app uses Provider for state management, combined with MVVM architecture.

  TaskViewModel – Manages the business logic and data for tasks
  ThemeViewModel – Controls theme mode (light/dark)
  HomeScreen, AddTaskScreen, TaskDetailScreen – View layer
  TaskService – Hive-based local storage service (with optional API integration)

# Screenshots

![image](https://github.com/user-attachments/assets/febf0d2e-ff94-4db7-b1cb-ddaf2754c2ac) | ![4](https://github.com/user-attachments/assets/9f64d53f-22c0-46e5-87f4-51a18611d8bc)
![3](https://github.com/user-attachments/assets/fef1d04c-60ac-4200-87b4-7378f4ce5e8a) | ![2](https://github.com/user-attachments/assets/571da18e-3259-4280-810a-aa8399604b8d)
![Screenshot_20250607_030928](https://github.com/user-attachments/assets/d0b7a6cb-91e6-42ae-b83d-a524e9fcd857) | ![Screenshot_20250607_031006](https://github.com/user-attachments/assets/aa3c50f6-0586-4b9c-b299-66b733b5ca9e)

# Bonus Features 

- Dark/Light Mode: Users can toggle between system themes
- Fake API Integration (via JSONPlaceholder):
    Fetches initial task list from an online source
    Currently commented out in due to debug errors
- MVVM architecture: Clean code separation and maintainability
-Responsive Design: Supports mobile and tablet layouts

# Folder Structure

![image](https://github.com/user-attachments/assets/e6b72da8-700c-4c54-8cff-bf6d3b7db79f)

# Tech Stack 
- Flutter -  3.32.2 
- Android Studio - Android Studio Meerkat Feature Drop | 2024.3.2
- Hive for local Storage
- Provider for state management
- MVVM architecture
- Responsive UI using

# License 
This project is licensed under the MIT License.

# Maintainer
Tejas Gujar. 
 Feel free to raise issues or pull requests for suggestions and improvements.
