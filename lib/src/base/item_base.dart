import 'dart:convert';


import 'package:models_base/src/base/article_base.dart';
import 'package:models_base/src/base/lot_base.dart';

class ItemDummy extends ItemAbstract {
  ItemDummy()
      : super(
          ArticleDummy(),
          <LotAbstract>[LotDummy()],
          2.0,
        );
}

abstract class ItemAbstract<A extends ArticleAbstract, L extends LotAbstract> {
  final A article;
  List<L>? lots;
  double quantity;

  ItemAbstract(this.article, this.lots, this.quantity);

  @override
  String toString() => "Item($article,$lots,$quantity)";

  Map<String, dynamic> toMap() {
    return {
      'article': article.toMap(),
      'lots': lots?.map((x) => x.toMap()).toList(),
      'quantity': quantity,
    };
  }

  String toJson() => json.encode(toMap());
}
