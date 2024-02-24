import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:user_app/common/widgets/custom_button.dart';
import 'package:user_app/core/auth/controller/auth_contoller.dart';
import 'package:user_app/common/widgets/custom_textfield.dart';
import 'package:user_app/res/app_colors.dart';
import 'package:user_app/utils/user_full_functions.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _userNameFouseNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final AuthController _authController = AuthController();

  bool isRegister = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                width: getDeviceWidth(context),
                decoration: const BoxDecoration(color: AppColors.primaryColor),
                child: Column(
                  children: [
                    SizedBox(
                      height: isRegister
                          ? getDeviceHeight(context) * 0.25
                          : getDeviceWidth(context) * 0.35,
                    ),
                    Text('Akhil Systems',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize:
                                getFontSize(30, getDeviceWidth(context)))),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2), // Offset of the shadow
                      blurRadius: 6.0, // Blur radius of the shadow
                      spreadRadius: 2.0, // Spread radius of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: getDeviceHeight(context) * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        isRegister ? "Sign-in" : "Create an account",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isRegister
                              ? "Don’t have an account? \t"
                              : "Already have an account? \t",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  getFontSize(15, getDeviceWidth(context))),
                        ),
                        GestureDetector(
                          onTap: () {
                            log("working");
                            isRegister = !isRegister;
                            setState(() {});
                          },
                          child: Text(
                            isRegister ? "Register" : "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                                fontSize:
                                    getFontSize(18, getDeviceWidth(context))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.02,
                    ),
                    AutofillGroup(
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Username",
                                style: TextStyle(
                                    fontSize: getFontSize(
                                        14, getDeviceWidth(context))),
                              ),
                            ),
                            SizedBox(
                              height: getDeviceHeight(context) * 0.011,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                height: 55,
                                child: CustomTextField(
                                  maxLength: 50,
                                  isNum: false,
                                  controller:
                                      _authController.usernameControllerVar,
                                  hintText: "",
                                  autofillHints: const [AutofillHints.username],
                                  node: _userNameFouseNode,
                                  nextNode: isRegister
                                      ? _passwordFocusNode
                                      : _emailFocusNode,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getDeviceHeight(context) * 0.02,
                            ),
                            isRegister
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                              fontSize: getFontSize(
                                                  14, getDeviceWidth(context))),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            getDeviceHeight(context) * 0.011,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: SizedBox(
                                          height: 55,
                                          child: CustomTextField(
                                              maxLength: 50,
                                              isNum: false,
                                              controller: _authController
                                                  .emailControllerVar,
                                              hintText: "",
                                              autofillHints: const [
                                                AutofillHints.email
                                              ],
                                              node: _emailFocusNode,
                                              nextNode: _passwordFocusNode),
                                        ),
                                      ),
                                      SizedBox(
                                        height: getDeviceHeight(context) * 0.02,
                                      ),
                                    ],
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: getFontSize(
                                        14, getDeviceWidth(context))),
                              ),
                            ),
                            SizedBox(
                              height: getDeviceHeight(context) * 0.011,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                height: 55,
                                child: CustomTextField(
                                  isPassword: true,
                                  maxLength: 50,
                                  isNum: false,
                                  controller:
                                      _authController.passwordControllerVar,
                                  hintText: "",
                                  autofillHints: const [AutofillHints.password],
                                  node: _passwordFocusNode,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.04,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                          height: 55,
                          child: CustomElevatedBtn(
                              text: isRegister ? "Sign In" : "Sign Up",
                              onPressed: () async {
                                if (isRegister &&
                                    _authController.vaildateLogin(context)) {
                                  //helps to navigate to main screen and necessary stuff
                                  _authController.login(
                                      context: context,
                                      username: _authController
                                          .usernameControllerVar.text,
                                      password: _authController
                                          .passwordControllerVar.text);
                                } else {
                                  if (_authController
                                      .vaildateRegister(context)) {
                                    log("register valid form : ${_authController.vaildateRegister(context)}");
                                    _authController.register(
                                        email: _authController
                                            .emailControllerVar.text,
                                        context: context,
                                        username: _authController
                                            .usernameControllerVar.text,
                                        password: _authController
                                            .passwordControllerVar.text);
                                  }
                                }
                              },
                              bgColor: AppColors.primaryColor,
                              borderColor: Colors.transparent,
                              textColor: Colors.white),
                        )),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
