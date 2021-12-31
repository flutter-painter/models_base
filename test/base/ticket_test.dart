import 'dart:convert';
import 'package:test/test.dart';

import 'package:models_base/src/base/ticket_base.dart';
import 'package:models_base/utils.dart';
import 'package:models_base/common.dart' show TicketType, PaiementType;

void main() {
  test('ticket', () {
    final _json = TicketDummy().toJson();
    final Map<String, dynamic> map = (json.decode(_json));

    expect(map['id'] == 1, isTrue);
    expect(map['shopUuid'] == '0', isTrue);
    //item
    final Map<String, dynamic> mapI = map['items'][0];
    final Map<String, dynamic> mapA = mapI['article'];
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
    final Map<String, dynamic> mapL = mapI['lots'][0];
    expect(mapL['id'] == 1, isTrue);
    expect(mapL['articleId'] == 1, isTrue);
    expect(mapL['productId'] == 1, isTrue);
    expect(mapL['isDefault'] == true, isTrue);
    expect(mapL['creationDate'] == WeebiDates.defaultDate.toIso8601String(),
        isTrue);
    expect(mapI['quantity'] == 2.0, isTrue);

    // Taxe
    final Map<String, dynamic> mapT = map['taxe'];
    expect(mapT['id'] == '1', isTrue);
    expect(mapT['name'] == 'noTax', isTrue);
    expect(mapT['percentage'] == 0.0, isTrue);
    expect(PaiementType.nope == PaiementType.tryParse(map['paiementType']),
        isTrue);
    expect(
        TicketType.stockOut == TicketType.tryParse(map['ticketType']), isTrue);

    expect(map['promo'] == 0.0, isTrue);
    expect(map['comment'] == 'comment', isTrue);
    expect(map['received'] == 0, isTrue);
    expect(map['herderId'] == '1', isTrue);
    expect(map['date'] == WeebiDates.defaultDate.toIso8601String(), isTrue);
    expect(map['contactPastPurchasingPower'] == 'contactPastPurchasingPower',
        isTrue);
    expect(map['status'] == true, isTrue);
    expect(map['statusUpdateDate'] == WeebiDates.defaultDate.toIso8601String(),
        isTrue);
    expect(map['creationDate'] == WeebiDates.defaultDate.toIso8601String(),
        isTrue);
  });
}
