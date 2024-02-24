import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:user_app/common/widgets/cam_and_galler_widget.dart';
import 'package:user_app/common/widgets/custom_button.dart';
import 'package:user_app/common/widgets/loader.dart';
import 'package:user_app/provider/main_provider.dart';

import 'package:user_app/res/app_colors.dart';
import 'package:user_app/res/assets.dart';
import 'package:user_app/utils/user_full_functions.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: getDeviceWidth(context) * 0.4,
          width: getDeviceWidth(context) * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: mainProvider.userProfileImage == null
                ? Image.asset(
                    defaultImage,
                    fit: BoxFit
                        .cover, // Use BoxFit.cover to ensure the image fits within the circular container
                  )
                : Image.file(
                    mainProvider.userProfileImage!,
                    fit: BoxFit
                        .cover, // Use BoxFit.cover to ensure the image fits within the circular container
                  ),
          ),
        ),
        CustomElevatedBtn(
            text: 'Update Profile Image',
            onPressed: () {
              camAndFile(
                  context: context,
                  galleryOnTap: () async {
                    try {
                      showLoading(context);
                      final image = await pickImageAndReturnImg(
                          imageType: ImageSource.gallery);
                      mainProvider.setUserProfileImage(image!);

                      hideLoading(context);
                    } catch (e) {
                      hideLoading(context);
                      showSnackBar(
                          context, "Something went wrong ! and Error: $e");
                    }
                  },
                  cameraOnTap: () async {
                    try {
                      showLoading(context);
                      final image = await pickImageAndReturnImg(
                          imageType: ImageSource.camera);

                      mainProvider.setUserProfileImage(image!);

                      hideLoading(context);
                    } catch (e) {
                      hideLoading(context);
                      showSnackBar(
                          context, "Something went wrong ! and Error: $e");
                    }
                  });
            },
            bgColor: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            textColor: Colors.white),
      ],
    );
  }
}
