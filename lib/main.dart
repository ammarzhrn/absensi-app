import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:absensi_app/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAHHgviyFRX_rxPsPxj-X1eUqJMLoGjJyM", //current_key
        appId: "1:993290325814:android:9c07c109f417cd7453ad97", //mobilesdk_app_id
        messagingSenderId: "993290325814",  //project_number
        projectId: "absensi-9b48e" //project_id
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
        ),
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent
        ),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}