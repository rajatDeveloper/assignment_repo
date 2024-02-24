import 'package:flutter/material.dart';
import 'package:user_app/models/user_model.dart';
import 'package:user_app/res/app_colors.dart';

class UserInfoBlockWidget extends StatelessWidget {
  final UserModel userModel;
  const UserInfoBlockWidget({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greyColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                userModel.username,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(
                userModel.email,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.vpn_key),
              title: Text(
                userModel.token,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
