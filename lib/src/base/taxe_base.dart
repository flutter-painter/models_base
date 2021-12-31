import 'dart:convert';

class TaxeDummy extends TaxeAbstract {
  TaxeDummy()
      : super(
          id: '1',
          name: 'noTax',
          percentage: 0.0,
        );
}

abstract class TaxeAbstract {
  final String id;
  final String name;
  final double percentage;

  const TaxeAbstract(
      {required this.id, required this.name, required this.percentage});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'percentage': percentage,
    };
  }

  String toJson() => json.encode(toMap());

  
}
