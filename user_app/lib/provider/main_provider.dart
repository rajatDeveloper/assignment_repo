import 'dart:io';

import 'package:flutter/material.dart';
import 'package:user_app/core/home/controller/home_controller.dart';
import 'package:user_app/models/user_model.dart';
import 'package:user_app/models/product_model.dart';

class MainProvider extends ChangeNotifier {
  UserModel? userModel;
  File? userProfileImage;
  List<ProductModel> productList = [];
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
    if (productList.isEmpty) {
      productList =
          await _homeController.getAllProductsAndSaleProduct(context: context);
      mainList = productList;
      notifyListeners();
    }
  }

  //load data for lazy loading - mainly I am adding same productList in back of mainProductList
  Future<void> loadMoreData() async {
    // Simulate loading delay
    await Future.delayed(const Duration(seconds: 2));

    // Add new data to a temporary list
    List<ProductModel> newData = List.from(productList);
    mainList.addAll(newData);

    // Reset lazy loading flag
    isLazyLoading = false;
    notifyListeners();
  }

  //updateing the lazzy loading
  void updateLazyLoading(bool val) {
    isLazyLoading = val;
    notifyListeners();
  }
}
