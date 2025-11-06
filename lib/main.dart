import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash_screen.dart';
import 'providers/theme_provider.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'IZZLY',
            theme: AppThemes.lightTheme.copyWith(
            textTheme: AppThemes.lightTheme.textTheme.apply(
              fontFamily: 'Poppins',
            ),
          ),
            darkTheme: AppThemes.darkTheme.copyWith(
              textTheme: AppThemes.darkTheme.textTheme.apply(
                fontFamily: 'Poppins',
              ),
            ),
            themeMode: themeProvider.themeMode,
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}