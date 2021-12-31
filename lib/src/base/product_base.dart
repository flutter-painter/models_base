import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:models_base/common.dart' show StockUnit;
import 'package:models_base/src/base/article_base.dart';
import 'package:models_base/utils.dart';

class ProductDummy extends ProductAbstract {
  ProductDummy()
      : super(
          id: 1,
          title: 'frometon',
          status: true,
          articles: [ArticleDummy()],
          stockUnit: StockUnit.unit,
          photo: 'photo',
          categories: ['categories'],
          barcode: 1,
          statusUpdateDate: WeebiDates.defaultDate,
          creationDate: WeebiDates.defaultDate,
        );
}

abstract class ProductAbstract<T extends ArticleAbstract> {
  final int id;
  String title;
  StockUnit stockUnit;
  String? photo;
  int? barcode;
  @observable
  bool status;
  DateTime? statusUpdateDate;
  List<T> articles; // article == subproduct
  final DateTime? creationDate;
  final List<String>? categories;

  ProductAbstract({
    required this.id,
    required this.title,
    required this.status,
    required this.articles,
    this.stockUnit = StockUnit.unit,
    this.photo,
    this.categories,
    this.barcode,
    this.statusUpdateDate,
    this.creationDate,
  });

  // factory Product.fromJson(Map<String, dynamic> json) =>
  //     _$ProductFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'stockUnit': stockUnit.toString(),
      'photo': photo ?? '',
      'barcode': barcode ?? 0,
      'status': status,
      'statusUpdateDate': statusUpdateDate?.toIso8601String(),
      'articles': articles.map((x) => x.toMap()).toList(),
      'creationDate':
          creationDate == null ? 'null' : creationDate!.toIso8601String(),
      'categories': categories?.map((e) => e).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Product(id: $id, title: $title, stockUnit: $stockUnit, photo: $photo, barcode: $barcode, status: $status, statusUpdateDate: $statusUpdateDate, articles: $articles)';
  }
}
