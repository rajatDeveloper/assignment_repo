import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/common/widgets/icon_btn.dart';
import 'package:user_app/core/auth/controller/auth_contoller.dart';
import 'package:user_app/core/profile/widgets/profile_image_widget.dart';
import 'package:user_app/core/profile/widgets/user_info_block.dart';
import 'package:user_app/provider/main_provider.dart';
import 'package:user_app/res/app_colors.dart';
import 'package:user_app/utils/user_full_functions.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile-screen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _authController = AuthController();
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primaryColor, //newly added line of code
        title: Text(
          "Profile Section",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: getFontSize(20, getDeviceWidth(context))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ProfileImageWidget(),
            FadeInLeftBig(
                child: UserInfoBlockWidget(userModel: mainProvider.userModel!)),
            Btn(
              text: 'Sign Out',
              color: AppColors.primaryColor,
              borderColor: Colors.transparent,
              needIcon: true,
              onTap: () {
                _authController.logout(context);
              },
              icon: Icons.logout_outlined,
            )
          ],
        ),
      ),
    );
  }
}
