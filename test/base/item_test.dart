import 'dart:convert';

import 'package:models_base/src/base/item_base.dart';
import 'package:models_base/utils.dart';
import 'package:test/test.dart';

void main() {
  test('item', () {
    final _json = ItemDummy().toJson();
    final Map<String, dynamic> map = (json.decode(_json));

    final Map<String, dynamic> mapA = map['article'];
    expect(mapA['id'] == 1, isTrue);
    expect(mapA['productId'] == 1, isTrue);
    expect(mapA['fullName'] == 'frometon forever', isTrue);
    expect(mapA['price'] == 1000, isTrue);
    expect(mapA['cost'] == 500, isTrue);
    expect(mapA['weight'] == 1, isTrue);
    expect(mapA['articleCode'] == 1, isTrue);
    expect(mapA['photo'] == 'photo', isTrue);
    expect(mapA['creationDate'] == WeebiDates.defaultDate.toIso8601String(),
        isTrue);
    expect(mapA['status'] == true, isTrue);

    final Map<String, dynamic> mapL = map['lots'][0];
    expect(mapL['id'] == 1, isTrue);
    expect(mapL['articleId'] == 1, isTrue);
    expect(mapL['productId'] == 1, isTrue);
    expect(mapL['isDefault'] == true, isTrue);
    expect(mapL['creationDate'] == WeebiDates.defaultDate.toIso8601String(),
        isTrue);

    expect(map['quantity'] == 2.0, isTrue);
  });
}
