import 'dart:convert';
import 'package:models_base/utils.dart';

class LotDummy extends LotAbstract {
  LotDummy()
      : super(
          id: 1,
          articleId: 1,
          productId: 1,
          isDefault: true,
          creationDate: WeebiDates.defaultDate,
        );
}

abstract class LotAbstract {
  final int id;
  final int articleId;
  final int productId;
  final bool isDefault;
  final DateTime? creationDate;

  const LotAbstract({
    required this.id,
    required this.articleId,
    required this.productId,
    this.isDefault = false,
    this.creationDate,
  });

  String get text {
    if (isDefault) {
      return 'Lot illimité $productId.$articleId.$id';
    } else {
      return 'Lot $productId.$articleId.$id';
    }
  }

  @override
  String toString() {
    return 'Lot(id: $id, articleId: $articleId, productId: $productId, isDefault: $isDefault, creationDate: $creationDate)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'articleId': articleId,
      'productId': productId,
      'isDefault': isDefault,
      'creationDate': creationDate!.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());
}
