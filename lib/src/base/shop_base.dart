import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:models_base/utils.dart';

class ShopDummy extends ShopAbstract {
  ShopDummy()
      : super(
          id: 1,
          managerMacAddress: 'pierre_entrepot',
          uuid: 'pierre_entrepot',
          name: 'name',
          tel: 'tel',
          mail: 'mail',
          address: 'address',
          lat: 'lat',
          long: 'long',
          shopKeeperName: 'shopKeeperName',
          shopKeeperTel: 'shopKeeperTel',
          shopKeeperMail: 'shopKeeperMail',
          updateDate: WeebiDates.defaultDate,
          status: true,
          statusUpdateDate: WeebiDates.defaultDate,
          serverStatus: true,
          serverStatusUpdateDate: WeebiDates.defaultDate,
          isProd: true,
          isLocked: false,
          promo: 0.0,
        );
}

abstract class ShopAbstract {
  final int id;
  String managerMacAddress;
  String uuid;
  String name;
  String tel;
  String mail;
  String address;
  String lat;
  String long;
  String shopKeeperName;
  String shopKeeperTel;
  String shopKeeperMail;
  DateTime updateDate;
  @observable
  bool status;
  DateTime statusUpdateDate;
  bool serverStatus;
  DateTime serverStatusUpdateDate;
  bool isProd;
  bool isLocked;
  double promo;

  ShopAbstract({
    required this.id,
    required this.managerMacAddress,
    required this.uuid,
    required this.name,
    required this.updateDate,
    required this.status,
    required this.statusUpdateDate,
    required this.serverStatus,
    required this.serverStatusUpdateDate,
    required this.isProd,
    required this.isLocked,
    required this.promo,
    this.tel = '',
    this.mail = '',
    this.address = '',
    this.lat = '',
    this.long = '',
    this.shopKeeperName = '',
    this.shopKeeperTel = '',
    this.shopKeeperMail = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'managerMacAddress': managerMacAddress,
      'uuid': uuid,
      'name': name,
      'tel': tel,
      'mail': mail,
      'address': address,
      'lat': lat,
      'long': long,
      'shopKeeperName': shopKeeperName,
      'shopKeeperTel': shopKeeperTel,
      'shopKeeperMail': shopKeeperMail,
      'updateDate': updateDate.toIso8601String(),
      'status': status,
      'statusUpdateDate': statusUpdateDate.toIso8601String(),
      'serverStatus': serverStatus,
      'serverStatusUpdateDate': serverStatusUpdateDate.toIso8601String(),
      'isProd': isProd,
      'isLocked': isLocked,
      'promo': promo,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Shop(id: $id, managerMacAddress: $managerMacAddress, uuid: $uuid, name: $name, tel: $tel, mail: $mail, address: $address, lat: $lat, long: $long, shopKeeperName: $shopKeeperName, shopKeeperTel: $shopKeeperTel, shopKeeperMail: $shopKeeperMail, updateDate: $updateDate, status: $status, statusUpdateDate: $statusUpdateDate, serverStatus: $serverStatus, serverStatusUpdateDate: $serverStatusUpdateDate, isProd: $isProd, isLocked: $isLocked, promo: $promo)';
  }
}
