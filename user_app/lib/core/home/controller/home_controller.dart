import 'package:flutter/material.dart';
import 'package:user_app/core/home/services/home_service.dart';
import 'package:user_app/models/product_model.dart';
import 'package:user_app/utils/user_full_functions.dart';

class HomeController {
  final _homeService = HomeService();

  Future<List<ProductModel>> getAllProductsAndSaleProduct(
      {String? category,
      String? search,
      bool? isSale,
      required BuildContext context}) async {
    var result = await _homeService.getAllProductsAndSaleProduct(
      category: category,
      search: search,
    );

    result.handleResponse(onSuccess: () {
      if (result.data != null) {
        return result.data!;
      } else {
        return [];
      }
    }, onFailed: () {
      showSnackBar(context, "Error : ${result.error!.errorMsg}");
    });

    return result.data ?? [];
  }
}
