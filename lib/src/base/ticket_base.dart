// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:models_base/src/base/item_base.dart';
import 'package:models_base/src/base/taxe_base.dart';
import 'package:models_base/src/common/paiement_type.dart';
import 'package:models_base/src/common/ticket_type.dart';
import 'package:models_base/utils.dart';

class TicketDummy extends TicketAbstract {
  TicketDummy()
      : super(
          id: 1,
          shopUuid: '0',
          items: [ItemDummy()],
          taxe: TaxeDummy(),
          promo: 0.0,
          comment: 'comment',
          received: 0,
          herderId: '1',
          date: WeebiDates.defaultDate,
          paiementType: PaiementType.nope,
          ticketType: TicketType.stockOut,
          contactPastPurchasingPower: 'contactPastPurchasingPower',
          status: true,
          statusUpdateDate: WeebiDates.defaultDate,
          creationDate: WeebiDates.defaultDate,
        );
}

abstract class TicketAbstract<I extends ItemAbstract, T extends TaxeAbstract> {
  final int id;
  final String shopUuid;
  final List<I> items;
  final T taxe;
  final double promo; //cvo
  final String comment; // comment || used for tank, cuve
  final String contactPastPurchasingPower; // used for Axe in collecte lait
  final int received;
  final DateTime date;
  final PaiementType paiementType;
  final TicketType ticketType;
  final String herderId;
  @observable
  bool status;
  DateTime? statusUpdateDate;
  final DateTime creationDate; // * using it as unique key to display the ticket
  @observable
  bool isInDash;

  TicketAbstract({
    required this.id,
    required this.shopUuid,
    required this.items,
    required this.taxe,
    this.promo = 0.0,
    this.comment = '', // used for tank, cuve
    this.contactPastPurchasingPower = '', // used for Axe in collecte lait
    required this.received,
    required this.date,
    required this.paiementType,
    required this.ticketType,
    required this.herderId,
    required this.status,
    this.statusUpdateDate,
    required this.creationDate,
    this.isInDash = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shopUuid': shopUuid,
      'items': items.map((x) => x.toMap()).toList(),
      'taxe': taxe.toMap(),
      'promo': promo,
      'comment': comment,
      'contactPastPurchasingPower': contactPastPurchasingPower,
      'received': received,
      'date': date.toIso8601String(),
      'paiementType': paiementType.toString(),
      'ticketType': ticketType.toString(),
      'herderId': herderId,
      'status': status,
      'statusUpdateDate': statusUpdateDate?.toIso8601String(),
      'creationDate': creationDate.toIso8601String(),
      'isInDash': isInDash,
    };
  }

  String toJson() => json.encode(toMap());

  int get totalSell => items
      .fold(
          0, (num value, item) => value + (item.quantity * item.article.price))
      .round();

  int get totalSellPromo =>
      promo != null ? (totalSell * promo / 100).round() : 0;

  int get totalSellHtIncludingPromo => totalSell - totalSellPromo;

  int get totalSellTaxes => ((taxe.percentage) > 0.0
          ? totalSellHtIncludingPromo * (taxe.percentage) / 100
          : 0)
      .round();

  int get totalSellTtc => totalSellHtIncludingPromo + totalSellTaxes;

  int get totalSpend {
    double total = 0;
    for (final item in items) {
      total += item.article.cost * item.quantity;
    }
    return total.round();
  }

  int get totalSpendPromo {
    return promo != null ? (totalSpend * promo / 100).round() : 0;
  }

  int get totalSpendHtIncludingPromo => totalSpend - totalSpendPromo;

  int get totalSpendTaxes => (taxe.percentage > 0
          ? totalSpendHtIncludingPromo * (taxe.percentage) / 100
          : 0)
      .round();

  int get totalSpendTtc => totalSpendHtIncludingPromo + totalSpendTaxes;

  int get totalSpendDeferredHt {
    double owed = 0;
    for (final item in items) {
      owed += (item.article.cost) * (item.quantity);
    }
    return owed.round();
  }

  int get totalSpendDeferredPromo =>
      promo != null ? (totalSpendDeferredHt * (promo / 100)).round() : 0;

  int get totalSpendDeferredHtIncludingPromo =>
      totalSpendDeferredHt - totalSpendDeferredPromo;

  int get totalSpendDeferredTaxes => taxe.percentage > 0.0
      ? (totalSpendDeferredHtIncludingPromo * taxe.percentage / 100).round()
      : 0;

  int get totalSpendDeferredTtc =>
      totalSpendDeferredHtIncludingPromo + totalSpendDeferredTaxes;

  int get totalSellDeferredHt {
    double owed = 0;
    for (final item in items) {
      owed += item.article.price * item.quantity;
    }
    return owed.round();
  }

  int get totalSellDeferredPromo =>
      promo != null ? (totalSellDeferredHt * (promo) / 100).round() : 0;

  int get totalSellDeferredHtIncludingPromo =>
      totalSellDeferredHt - totalSellDeferredPromo;

  int get totalSellDeferredTaxes => taxe.percentage > 0.0
      ? (totalSellDeferredHtIncludingPromo * (taxe.percentage) / 100).round()
      : 0;

  int get totalSellDeferredTtc =>
      totalSellDeferredHtIncludingPromo + totalSellDeferredTaxes;

  int get total {
    switch (ticketType) {
      case TicketType.sell:
        return totalSellTtc;
      case TicketType.sellDeferred:
        return totalSellDeferredTtc;
      case TicketType.sellCovered:
        return received;
      case TicketType.spend:
        return totalSpendTtc;
      case TicketType.spendDeferred:
        return totalSpendDeferredTtc;
      case TicketType.spendCovered:
        return received;
      case TicketType.wage:
        return received;
      case TicketType.unknown:
        print('unknow ticket type in calculateSumsOfTicket');
        return 0;
      default:
        return 0;
    }
  }

  String get deactivatedDate => status ? '' : '$statusUpdateDate';

  String get paiement {
    if (paiementType == PaiementType.nope) {
      return 'a credit';
    } else if (paiementType == PaiementType.yup) {
      return 'yup';
    } else if (paiementType == PaiementType.goods) {
      return 'autres';
    } else if (paiementType == PaiementType.cheque) {
      return 'cheque';
    } else if (paiementType == PaiementType.cb) {
      return 'carte';
    }
    return 'cash';
  }

  String get type {
    if (ticketType == TicketType.stockIn) {
      return 'Entrée stock';
    } else if (ticketType == TicketType.stockOut) {
      return 'Sortie de stock';
    } else if (ticketType == TicketType.sell) {
      return 'Vente';
    } else if (ticketType == TicketType.sellCovered) {
      return 'Versement client';
    } else if (ticketType == TicketType.sellDeferred) {
      return 'Vente a credit';
    } else if (ticketType == TicketType.spend) {
      return 'Achat';
    } else if (ticketType == TicketType.spendCovered) {
      return 'Versement fournisseur';
    } else if (ticketType == TicketType.spendDeferred) {
      return 'Achat a credit';
    } else if (ticketType == TicketType.wage) {
      return 'Salaire';
    }
    return 'Autres';
  }
}
