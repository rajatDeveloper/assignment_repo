import 'dart:convert';

import 'package:user_app/base/base_service.dart';
import 'package:user_app/models/product_model.dart';
import 'package:user_app/network/api_constants.dart';
import 'package:user_app/network/api_response.dart';
import 'package:user_app/network/network_manager.dart';
import 'package:user_app/network/network_request.dart';

class HomeService extends BaseService {
  //to get list of productModel

  Future<ApiResponse<List<ProductModel>?>> getAllProductsAndSaleProduct(
      {String? category, String? search}) async {
    NetworkRequest request = NetworkRequest(
      category == null || category == "All"
          ? "$baseUrl$getProductUrl"
          : "$baseUrl$getProductUrl?category=$category",
      RequestMethod.get,
      headers: getHeaders(),
    );

    final result =
        await NetworkManager.instance.perform<List<ProductModel>?>(request);

    if (result.json != null) {
      var userMap = result.json;
      result.data = userMap
          .map<ProductModel>((json) => ProductModel.fromJson(jsonEncode(json)))
          .toList();
    }

    return result;
  }
}
