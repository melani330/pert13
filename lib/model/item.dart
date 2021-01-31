import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final String image;
  final String desc;
  final int qty;
  final String status;

  Item({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.qty,
    this.status,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      qty: json['qty'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'desc': desc,
        'qty': qty,
        'status': status,
      };

  factory Item.fromFireStore(DocumentSnapshot doc) {
    return Item(
      id: doc['id'],
      name: doc['name'],
      image: doc['image'],
      desc: doc['desc'],
      qty: doc['qty'],
      status: doc['status'],
    );
  }
}
