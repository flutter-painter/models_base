class StockUnit {
  final String _unit;
  const StockUnit._(this._unit);

  @override
  String toString() => _unit;

  static const StockUnit box = StockUnit._('box');
  static const StockUnit centiliter = StockUnit._('centiliter');
  static const StockUnit centimeter = StockUnit._('centimeter');
  static const StockUnit gram = StockUnit._('gram');
  static const StockUnit kilogram = StockUnit._('kilogram');
  static const StockUnit liter = StockUnit._('liter');
  static const StockUnit meter = StockUnit._('meter');
  static const StockUnit unit = StockUnit._('unit');
  static const StockUnit unknown = StockUnit._('unknown');

  // Map<String, dynamic> toMap() => {'StockUnit': _unit};
  // String toJson() => json.encode(toMap());

  // factory StockUnit.fromMap(Map<String, dynamic> map) =>
  //     StockUnit.tryParse(map['StockUnit'] as String);

  // factory StockUnit.fromJson(String source) =>
  //     StockUnit.fromMap(json.decode(source));

  static StockUnit tryParse(String val) {
    switch (val) {
      case 'box':
        return StockUnit.box;
      case 'centiliter':
        return StockUnit.centiliter;
      case 'centimeter':
        return StockUnit.centimeter;
      case 'gram':
        return StockUnit.gram;
      case 'kilogram':
        return StockUnit.kilogram;
      case 'liter':
        return StockUnit.liter;
      case 'meter':
        return StockUnit.meter;
      case 'unit':
        return StockUnit.unit;
      default:
        print('$val is not a valid StockUnit');
        return StockUnit.unknown;
    }
  }

  String get stockUnitText {
    switch (this) {
      case StockUnit.kilogram:
        return 'kg';
      case StockUnit.gram:
        return 'g';
      case StockUnit.liter:
        return 'l';
      case StockUnit.centiliter:
        return 'cl';
      case StockUnit.unit:
        return 'unite';
      case StockUnit.box:
        return 'boite';
      case StockUnit.centimeter:
        return 'cm';
      case StockUnit.meter:
        return 'm';
      default:
        return '?';
    }
  }

  static const List<StockUnit> units = [
    StockUnit.kilogram,
    StockUnit.gram,
    StockUnit.liter,
    StockUnit.centiliter,
    StockUnit.unit,
    StockUnit.box,
    StockUnit.centimeter,
    StockUnit.meter
  ];
}
