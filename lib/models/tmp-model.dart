import 'package:firebase_database/firebase_database.dart';

class TmpModel {
  final String address;
  final String sellerName;
  final String strategy;
  final String key;

  TmpModel({
    this.key,
    this.address,
    this.sellerName,
    this.strategy
  });

  factory TmpModel.fromSnapshot(DataSnapshot snapshot) {
    Map x = snapshot.value;
    print("KEYNYA ADALAH ${snapshot.key}");

    String _key = snapshot.key;
    String _address = snapshot.value['address'];
    return new TmpModel(
      key: _key,
      address: _address
    );
  }
}