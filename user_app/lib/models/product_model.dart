import 'dart:convert';

class ProductModel {
  int? id;
  String? productName;
  String? imageData;
  String? shortDes;
  String? longDes;
  int? mainPrice;
  int? afterDiscountPrice;
  String? category;
  bool? isSale;
  int? stock;

  ProductModel({
    this.id,
    this.productName,
    this.imageData,
    this.shortDes,
    this.longDes,
    this.mainPrice,
    this.afterDiscountPrice,
    this.category,
    this.isSale,
    this.stock,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'imageData': imageData,
      'shortDes': shortDes,
      'longDes': longDes,
      'mainPrice': mainPrice,
      'afterDiscountPrice': afterDiscountPrice,
      'category': category,
      'isSale': isSale,
      'stock': stock,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      productName: map['productName'],
      imageData: map['imageData'],
      shortDes: map['shortDes'],
      longDes: map['longDes'],
      mainPrice: map['mainPrice']?.toInt(),
      afterDiscountPrice: map['afterDiscountPrice']?.toInt(),
      category: map['category'],
      isSale: map['isSale'],
      stock: map['stock']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
