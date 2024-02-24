import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:user_app/core/auth/controller/auth_contoller.dart';
import 'package:user_app/res/app_colors.dart';
import 'package:user_app/utils/user_full_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  //using routename for getting name of route
  static const String routeName = "/splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController _authController = AuthController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authController.navigateToMainContent(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: FadeInDownBig(
            child: Text(
              "Akhil Systems",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: getFontSize(34, getDeviceWidth(context)),
              ),
            ),
          ),
        ));
  }
}
