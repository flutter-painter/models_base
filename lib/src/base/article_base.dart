import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:models_base/utils.dart';

class ArticleDummy extends ArticleAbstract {
  ArticleDummy()
      : super(
          productId: 1,
          id: 1,
          fullName: 'frometon forever',
          price: 1000,
          cost: 500,
          weight: 1,
          articleCode: 1,
          photo: 'photo',
          creationDate: WeebiDates.defaultDate,
          status: true,
        );
}

abstract class ArticleAbstract {
  final int productId;
  final int id;
  String fullName;
  int price;
  int cost;
  double weight;
  int? articleCode;
  String? photo;
  final DateTime? creationDate;
  @observable
  bool status;

  ArticleAbstract({
    required this.productId,
    required this.id,
    required this.fullName,
    this.price = 0,
    this.cost = 0,
    this.weight = 1.0,
    this.articleCode,
    this.photo,
    this.creationDate,
    this.status = true,
  });

  String nameWithoutProductPart(String productTitle) {
    String name;
    if (productTitle.length < fullName.length &&
        fullName.contains(productTitle)) {
      name = fullName.substring(productTitle.length);
    } else {
      name = fullName;
    }
    return name.trim();
  }

  @override
  String toString() {
    return """
Article(
                    productId: $productId,
                    id: $id,
                    fullName: '$fullName',
                    price: $price,
                    cost: $cost,
                    weight: $weight,
                    articleCode: $articleCode,
                    status: $status,
                    )
""";
//photo:$photo removed
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'id': id,
      'fullName': fullName,
      'price': price,
      'cost': cost,
      'weight': weight,
      'articleCode': articleCode ?? 0,
      'photo': photo ?? '',
      'creationDate': creationDate!.toIso8601String(),
      'status': status,
    };
  }

  String toJson() => json.encode(toMap());
}
