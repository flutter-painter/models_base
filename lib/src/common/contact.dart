import 'dart:convert';

abstract class Contact {
  final int id;
  String firstName;
  String lastName;
  String tel;
  String mail;
  String address; // axe de collecte
  String avatar; // photo
  DateTime? updateDate; // if Contact info are updated, keep date here
  DateTime? statusUpdateDate; // if status changes, update date here
  bool status;
  int overdraft; // clientBalance limit

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.tel = '',
    this.mail = '',
    this.avatar = '',
    this.address = '',
    this.overdraft = 0,
    this.status = true,
    this.updateDate,
    this.statusUpdateDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'tel': tel,
      'mail': mail,
      'address': address,
      'avatar': avatar,
      'updateDate': updateDate?.millisecondsSinceEpoch,
      'statusUpdateDate': statusUpdateDate?.millisecondsSinceEpoch,
      'status': status,
      'overdraft': overdraft,
    };
  }

  // factory Contact.fromMap(Map<String, dynamic> map) {
  //   return Herder(
  //     id: map['id'],
  //     bidon: map['bidon'],
  //     firstName: map['firstName'],
  //     lastName: map['lastName'],
  //     tel: map['tel'],
  //     mail: map['mail'],
  //     address: map['address'],
  //     avatar: map['avatar'],
  //     updateDate: map['updateDate'] != null
  //         ? DateTime.fromMillisecondsSinceEpoch(map['updateDate'])
  //         : null,
  //     statusUpdateDate: map['statusUpdateDate'] != null
  //         ? DateTime.fromMillisecondsSinceEpoch(map['statusUpdateDate'])
  //         : null,
  //     status: map['status'],
  //     overdraft: map['overdraft'],
  //   );
  // }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.tel == tel &&
        other.mail == mail &&
        other.address == address &&
        other.avatar == avatar &&
        other.updateDate == updateDate &&
        other.statusUpdateDate == statusUpdateDate &&
        other.status == status &&
        other.overdraft == overdraft;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        tel.hashCode ^
        mail.hashCode ^
        address.hashCode ^
        avatar.hashCode ^
        updateDate.hashCode ^
        statusUpdateDate.hashCode ^
        status.hashCode ^
        overdraft.hashCode;
  }
}
