import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/core/auth/screens/splash_screen.dart';
import 'package:user_app/provider/main_provider.dart';
import 'package:user_app/res/app_colors.dart';
import 'package:user_app/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        routes: getAppRoutes(),
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
