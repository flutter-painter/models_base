import 'dart:convert';

import 'package:models_base/src/base/lot_base.dart';
import 'package:models_base/utils.dart';
import 'package:test/test.dart';

void main() {
  test('lot', () {
    final _json = LotDummy().toJson();
    final Map<String, dynamic> map = (json.decode(_json));
    expect(map['id'] == 1, isTrue);
    expect(map['articleId'] == 1, isTrue);
    expect(map['productId'] == 1, isTrue);
    expect(map['isDefault'] == true, isTrue);
    expect(map['creationDate'] == WeebiDates.defaultDate.toIso8601String(),
        isTrue);
  });
}
