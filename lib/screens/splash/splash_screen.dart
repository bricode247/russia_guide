import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../home/home_screen.dart'; // Importamos la pantalla de destino

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Temporizador de 2.5 segundos para navegar a HomeScreen
    Future.delayed(const Duration(milliseconds: 2500), () {
      // Verificamos si el widget sigue montado antes de navegar
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blanco,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book,
              size: 100,
              color: AppColors.azulPrimario,
            ),
            const SizedBox(height: 16),
            Text(
              'РОССИЯ ГАЙД',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.azulOscuro,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tu guía para vivir en Rusia',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grisMedio,
              ),
            ),
          ],
        ),
      ),
    );
  }
}