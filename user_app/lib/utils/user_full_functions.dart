import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

//using this for responsive screen

double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

//using custom snack bar
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

//using this function for responsive text
double getFontSize(double size, double screenWidth) {
  return size * screenWidth / 414;
}

//shared preferences functions
void setDataToLocal({required String key, required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getSavedDataByKey({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? data = prefs.getString(key);
  return data ?? "";
}

Future<void> removeDataByKey({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}

//to fet image from gallery and camera
Future<File?> pickImageAndReturnImg({required ImageSource imageType}) async {
  try {
    final pickedImage = await ImagePicker().pickImage(source: imageType);

    return File(pickedImage!.path);
  } catch (e) {
    return null;
  }
}
