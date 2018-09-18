import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class TmpModel {
  final String address;
  final String sellerName;
  final String strategy;
  final String key;

  DatabaseReference tmpDeals = FirebaseDatabase.instance.reference().child('/tmpDeals');

  TmpModel({
    this.key,
    this.address,
    this.sellerName,
    this.strategy
  });

  factory TmpModel.fromSnapshot(String key, Map snapshot) {
    return new TmpModel(
      key: key,
      address: snapshot['address']
    );
  }
}