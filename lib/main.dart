import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'themes/app_colors.dart';

void main() {
  runApp(const RussiaGuideApp());
}

class RussiaGuideApp extends StatelessWidget {
  const RussiaGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Russia Guide',
      theme: ThemeData(
        // Usamos nuestro color primario como tema base
        primaryColor: AppColors.azulPrimario,
        scaffoldBackgroundColor: AppColors.blanco,
        // Podemos definir más temas después
      ),
      home: const SplashScreen(),
    );
  }
}