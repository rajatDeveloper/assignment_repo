import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_app/core/home/controller/home_controller.dart';
import 'package:user_app/models/user_model.dart';
import 'package:user_app/models/product_model.dart';

class MainProvider extends ChangeNotifier {
  UserModel? userModel;
  File? userProfileImage;

  List<ProductModel> mainList = [];
  bool isLazyLoading = false;

  final _homeController = HomeController();

  //for setting up user data
  void setUserModel(UserModel userModel) {
    this.userModel = userModel;
    notifyListeners();
  }

  //for setting up user profile image
  void setUserProfileImage(File userProfileImage) {
    this.userProfileImage = userProfileImage;
    notifyListeners();
  }

  //for setting up product list
  Future<void> setProductData(BuildContext context) async {
    //using mainList to display the product list and product list is mainData of product list

    mainList =
        await _homeController.getAllProductsAndSaleProduct(context: context);

    log("Size of mainList is : while init  ${mainList.length}");
    notifyListeners();
  }

  //load data for lazy loading - mainly I am adding same productList in back of mainProductList
  Future<void> loadMoreData(BuildContext context) async {
    if (isLazyLoading) {
      // Avoid multiple simultaneous requests
      return;
    }
    // Mark lazy loading as in progress
    isLazyLoading = true;
    notifyListeners();

    try {
      log("Size of mainList before adding ${mainList.length}");
      await Future.delayed(const Duration(seconds: 1));

      final List<ProductModel> newData =
          await _homeController.getAllProductsAndSaleProduct(context: context);
      mainList.addAll(newData);
      log("Size of mainList after adding ${mainList.length}");

      // Reset lazy loading flag
      isLazyLoading = false;
    } catch (e) {
      // Handle any errors that occur during data loading
      print("Error loading more data: $e");
      // Reset lazy loading flag in case of error
      isLazyLoading = false;
    } finally {
      // Notify listeners regardless of success or failure
      notifyListeners();
    }
  }

  //updateing the lazzy loading
  void updateLazyLoading(bool val) {
    isLazyLoading = val;
    notifyListeners();
  }
}
