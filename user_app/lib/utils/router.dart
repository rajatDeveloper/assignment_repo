import 'package:flutter/material.dart';
import 'package:user_app/core/auth/screens/auth_screen.dart';
import 'package:user_app/core/auth/screens/splash_screen.dart';
import 'package:user_app/core/home/screens/home_screen.dart';

import 'package:user_app/core/profile/screens/profile_screen.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    //  AgentListScreen.routeName: (context) {
    //       var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //       var listData = args['listData'] as List<AgentModel>;
    //       var caseModel = args['caseModel'] as CaseModel;

    //       return AgentListScreen(
    //         agents: listData,
    //         caseModel: caseModel,
    //       );
    //     },

    //splash screen route
    SplashScreen.routeName: (context) => const SplashScreen(),
    //profile screen route
    ProfileScreen.routeName: (context) => const ProfileScreen(),
    //authScreen route
    AuthScreen.routeName: (context) => const AuthScreen(),
    //homeScreen route
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
  return appRoutes;
}
