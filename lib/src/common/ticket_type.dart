class TicketType {
  final String _ticketType;
  const TicketType._(this._ticketType);

  @override
  String toString() => _ticketType;

  static const TicketType sell = TicketType._('sell');
  static const TicketType sellDeferred = TicketType._('sellDeferred');
  static const TicketType sellCovered = TicketType._('sellCovered');
  static const TicketType spend = TicketType._('spend');
  static const TicketType spendDeferred = TicketType._('spendDeferred');
  static const TicketType spendCovered = TicketType._('spendCovered');
  static const TicketType stockIn = TicketType._('stockIn');
  static const TicketType stockOut = TicketType._('stockOut');
  static const TicketType wage = TicketType._('wage');
  static const TicketType unknown = TicketType._('');

  static const financialTypes = <TicketType>[
    sell,
    sellDeferred,
    sellCovered,
    spend,
    spendDeferred,
    spendCovered,
    wage,
  ];

  bool get isShopInput =>
      this == spend || this == spendDeferred || this == stockIn;

  bool get isShopOutput =>
      this == sell || this == sellDeferred || this == stockOut;

  static TicketType tryParse(String val) {
    switch (val) {
      case 'sell':
        return TicketType.sell;
      case 'sellDeferred':
        return TicketType.sellDeferred;
      case 'sellCovered':
        return TicketType.sellCovered;
      case 'spend':
        return TicketType.spend;
      case 'spendCovered':
        return TicketType.spendCovered;
      case 'spendDeferred':
        return TicketType.spendDeferred;
      case 'stockIn':
        return TicketType.stockIn;
      case 'stockOut':
        return TicketType.stockOut;
      case 'wage':
        return TicketType.wage;
      case '':
        return TicketType.unknown;
      default:
        print('$val is not a valid TicketType');
        return TicketType.unknown;
    }
  }

  static String typeString(TicketType ticketType) {
    if (ticketType == TicketType.stockIn) {
      return 'Entree de stock';
    } else if (ticketType == TicketType.stockOut) {
      return 'Sortie de stock';
    } else if (ticketType == TicketType.sell) {
      return 'Vente';
    } else if (ticketType == TicketType.sellCovered) {
      return 'Versement sur compte c';
    } else if (ticketType == TicketType.sellDeferred) {
      return 'Vente de fourrage';
    } else if (ticketType == TicketType.spend) {
      return 'Achat';
    } else if (ticketType == TicketType.spendCovered) {
      return 'Versement sur compte f';
    } else if (ticketType == TicketType.spendDeferred) {
      return 'Collecte lait a c'; // KSDE specific 'Achat via compte f'
    } else if (ticketType == TicketType.wage) {
      return 'Salaire';
    } else {
      return 'Type de ticket Inconnu';
    }
  }
}
