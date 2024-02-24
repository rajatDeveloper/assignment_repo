import 'package:flutter/material.dart';
import 'package:user_app/res/app_colors.dart';
import 'package:user_app/utils/user_full_functions.dart';

bool isLoading = false;

void camAndFile(
    {required BuildContext context,
    required Function galleryOnTap,
    required Function cameraOnTap}) {
  isLoading = true;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        child: WillPopScope(
            child: Container(
              alignment: Alignment.center,
              height: getDeviceHeight(context) * 0.2,
              width: getDeviceWidth(context) * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            hideCamAndFile(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.primaryColor,
                            size: 30,
                          )),
                      const SizedBox(width: 5),
                    ],
                  ),
                  SizedBox(
                    height: getDeviceHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          hideCamAndFile(context);
                          cameraOnTap();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.camera_alt,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text(
                                'Camera',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: getFontSize(
                                        15, getDeviceWidth(context)),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          hideCamAndFile(context);
                          galleryOnTap();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.photo,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: getFontSize(
                                        15, getDeviceWidth(context)),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onWillPop: () async {
              return false;
            }),
      );
    },
  );

  // return file;
}

void hideCamAndFile(BuildContext context) {
  if (isLoading) {
    Navigator.of(context).pop();
    isLoading = false;
  }
}
