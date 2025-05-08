import 'package:expenses_tracker_app_v2/components/pay_receive_widget.dart';
import 'package:expenses_tracker_app_v2/screens/intro_screen.dart';
import 'package:expenses_tracker_app_v2/screens/main_screen.dart';
import 'package:expenses_tracker_app_v2/theme/light_mode.dart';
import 'package:expenses_tracker_app_v2/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'model/user_data.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  // Init the Hive.
  await Hive.initFlutter();

  // Open Hive.
  var box = Hive.openBox('UserBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: lightMode,
    );
  }
}
