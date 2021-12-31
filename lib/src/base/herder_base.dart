import 'dart:convert';

import 'package:models_base/utils.dart';
import 'package:models_base/common.dart' show Contact;

class HerderDummy extends HerderAbstract {
  HerderDummy()
      : super(
          id: 1,
          bidon: 1,
          firstName: 'super',
          lastName: 'éleveur',
          updateDate: WeebiDates.defaultDate,
          statusUpdateDate: WeebiDates.defaultDate,
          status: true,
          tel: 'tel',
          mail: 'mail',
          address: 'address',
          avatar: 'avatar',
          overdraft: 0,
          milkMonthQuota: 0,
          area: 'area',
          bank: 'bank',
          category: 'category',
          qrcode: 'qrcode',
          identity: 'identity',
          isWoman: true,
          carteNFC: 'carteNFC',
          pointCollecte: 'pointCollecte',
        );
}

abstract class HerderAbstract extends Contact {
  String area; // pole laitier
  String bank; // numero de compte
  String identity; // sepcific ldb
  String category; // sepcific ldb
  String qrcode; // sepcific ldb
  int milkMonthQuota; // specific to ldb,
  int bidon;
  bool isWoman; // ie sex
  String carteNFC;
  String pointCollecte;

  HerderAbstract({
    //
    // Milky attributes below
    required this.isWoman,
    required this.bidon,
    required this.area,
    required this.bank,
    required this.identity,
    required this.category,
    required this.qrcode,
    required this.milkMonthQuota,
    required this.carteNFC,
    required this.pointCollecte,
    //
    // Contact inherited attributes below
    required final int id,
    required String firstName,
    required String lastName,
    required DateTime? updateDate,
    required DateTime? statusUpdateDate,
    required bool status,
    String tel = '',
    String mail = '',
    String address = '',
    String avatar = '',
    int overdraft = 0,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          updateDate: updateDate,
          statusUpdateDate: statusUpdateDate,
          status: status,
          tel: tel,
          mail: mail,
          address: address,
          avatar: avatar,
          overdraft: overdraft,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bidon': bidon,
      'firstName': firstName,
      'lastName': lastName,
      'tel': tel,
      'mail': mail,
      'address': address,
      'avatar': avatar,
      'updateDate': updateDate?.toIso8601String(),
      'statusUpdateDate': statusUpdateDate?.toIso8601String(),
      'status': status,
      'overdraft': overdraft,
      'area': area,
      'bank': bank,
      'identity': identity,
      'category': category,
      'qrcode': qrcode,
      'milkMonthQuota': milkMonthQuota,
      'isWoman': isWoman,
      'carteNFC': carteNFC,
      'pointCollecte': pointCollecte,
    };
  }

  @override
  String toJson() => json.encode(toMap());
}
