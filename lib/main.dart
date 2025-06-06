// main.dart (updated)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/locator.dart';
import 'core/theme.dart';
import 'models/task.dart';
import 'view_models/task_view_model.dart';
import 'view_models/theme_view_model.dart';
import 'views/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, _) {
          return MaterialApp(
            title: 'TaskMate',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeViewModel.currentTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
