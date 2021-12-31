// live with typo mistake
class PaiementType {
  final String _paiementType;
  const PaiementType._(this._paiementType);

  @override
  String toString() => _paiementType;

  static const PaiementType cash = PaiementType._('cash');
  static const PaiementType yup = PaiementType._('yup');
  static const PaiementType nope = PaiementType._('nope');
  static const PaiementType goods = PaiementType._('goods');
  static const PaiementType cheque = PaiementType._('cheque');
  static const PaiementType cb = PaiementType._('cb');
  static const PaiementType unknown = PaiementType._('');

  // Map<String, dynamic> toMap() {
  //   return {'paiementType': _paiementType};
  // }

  // factory PaiementType.fromMap(Map<String, dynamic> map) {
  //   return tryParse(map['paiementType'] as String);
  // }

  // factory PaiementType.fromJsonTwisted(dynamic json) {
  //   if (json is String) {
  //     return PaiementType.tryParse(json); // from DB sembast
  //   } else {
  //     return json['paiementType']; // from server
  //   }
  // }

  // String toJson() => json.encode(toMap());

  // factory PaiementType.fromJson(String source) =>
  //     PaiementType.fromMap(json.decode(source));

  static PaiementType tryParse(String val) {
    switch (val) {
      case 'cash':
        return PaiementType.cash;
      case 'yup':
        return PaiementType.yup;
      case 'goods':
        return PaiementType.goods;
      case 'cheque':
        return PaiementType.cheque;
      case 'cb':
        return PaiementType.cb;
      case 'nope':
        return PaiementType.nope;
      case '':
        return PaiementType.unknown;
      default:
        print('$val is not a valid paiementType');
        return PaiementType.unknown;
    }
  }

  static String paiementString(PaiementType paiement) {
    if (paiement == PaiementType.nope) {
      return 'À crédit';
    } else if (paiement == PaiementType.yup) {
      return 'Yup';
    } else if (paiement == PaiementType.cheque) {
      return 'Chèque';
    } else if (paiement == PaiementType.goods) {
      return 'Biens';
    } else if (paiement == PaiementType.cash) {
      return 'Cash';
    } else {
      return 'Inconnu';
    }
  }
}
