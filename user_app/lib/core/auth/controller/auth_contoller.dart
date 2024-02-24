import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/common/widgets/loader.dart';
import 'package:user_app/core/auth/screens/auth_screen.dart';
import 'package:user_app/core/auth/screens/splash_screen.dart';
import 'package:user_app/core/auth/services/auth_service.dart';
import 'package:user_app/core/home/screens/home_screen.dart';
import 'package:user_app/models/user_model.dart';
import 'package:user_app/provider/main_provider.dart';
import 'package:user_app/utils/user_full_functions.dart';

class AuthController {
  
  final TextEditingController emailControllerVar = TextEditingController();
  final TextEditingController usernameControllerVar = TextEditingController();
  final TextEditingController passwordControllerVar = TextEditingController();

  AuthService _service = AuthService();

  bool vaildateLogin(BuildContext context) {
    if (usernameControllerVar.text.isEmpty) {
      showSnackBar(context, 'Please enter username ');
      return false;
    } else if (passwordControllerVar.text.isEmpty) {
      showSnackBar(context, 'Please enter password ');
      return false;
    }
    return true;
  }

  bool vaildateRegister(BuildContext context) {
    if (usernameControllerVar.text.isEmpty) {
      showSnackBar(context, 'Please enter username ');
      return false;
    } else if (!(emailControllerVar.text.contains('@') &&
        emailControllerVar.text.contains('.'))) {
      showSnackBar(context, 'Please enter valid email address');
      return false;
    } else if (passwordControllerVar.text.isEmpty) {
      showSnackBar(context, 'Please enter password ');
      return false;
    }
    return true;
  }

  void login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    try {
      showLoading(context);

      var result = await _service.loginUserService(
          username: username, password: password);
      result.handleResponse(onFailed: () {
        hideLoading(context);
        showSnackBar(context, 'Error : ${result.error!.errorMsg}');
      }, onSuccess: () {
        hideLoading(context);

        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );

        showSnackBar(
            context, "User with username: $username sign-in successfully !");

        String userString =
            "${result.data['username']} ${result.data['token']} ${result.data['id']} ${result.data['email']} ";

        //setting data of provider

        final mainProvider = Provider.of<MainProvider>(context, listen: false);

        mainProvider.setUserModel(UserModel(
            email: result.data['email'],
            id: result.data['id'],
            token: result.data['token'],
            username: result.data['username']));

        setDataToLocal(key: 'auth', value: userString);
      });
    } catch (e) {
      hideLoading(context);
      showSnackBar(context, 'Something went wrong !');
    }
  }

  void logout(BuildContext context) async {
    await removeDataByKey(key: 'auth');

    showSnackBar(context, 'Logout successfully');

    Navigator.pushNamedAndRemoveUntil(
      context,
      SplashScreen.routeName,
      (route) => false,
    );
  }

  void register(
      {required BuildContext context,
      required String username,
      required String password,
      required String email}) async {
    try {
      showLoading(context);
      var result = await _service.registerUserService(
          username: username, password: password, email: email);
      result.handleResponse(onFailed: () {
        hideLoading(context);
        showSnackBar(context, 'Error : ${result.error!.errorMsg}');
      }, onSuccess: () {
        hideLoading(context);
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );

        showSnackBar(
            context, "User with username: $username sign-up successfully !");

        String userString =
            "${result.data['username']} ${result.data['token']} ${result.data['id']} ${result.data['email']} ";

        //setting data of provider

        final mainProvider = Provider.of<MainProvider>(context, listen: false);

        mainProvider.setUserModel(UserModel(
            email: result.data['email'],
            id: result.data['id'],
            token: result.data['token'],
            username: result.data['username']));

        //save data to local storage
        setDataToLocal(key: 'auth', value: userString);
      });
    } catch (e) {
      hideLoading(context);
      showSnackBar(context, 'Something went wrong !');
    }
  }

  navigateToMainContent({required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 3));
    var key = await getSavedDataByKey(key: 'auth');

    String userString = key;

    log('user : $userString');

    if (key == '') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } else {
      //now setting userModel using user
      //  "${result.data['username']} ${result.data['token']} ${result.data['id']} ${result.data['email']} ";

      final mainProvider = Provider.of<MainProvider>(context, listen: false);

      var user = userString.split(' ');

      mainProvider.setUserModel(UserModel(
          username: user[0],
          email: user[3],
          id: int.parse(
            user[2],
          ),
          token: user[1]));

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (route) => false,
      );
    }
  }
}
