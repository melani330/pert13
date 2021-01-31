import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myshirt/model/item.dart';

class ItemProvider {
  static Stream<List<Item>> fetchAll() {
    return FirebaseFirestore.instance.collection('item').snapshots().map(
        (list) => list.docs.map((doc) => Item.fromFireStore(doc)).toList());
  }

  static Stream<List<Item>> minQtyStream() {
    return FirebaseFirestore.instance
        .collection('item')
        .where('qty', isLessThan: 10)
        .snapshots()
        .map(
            (list) => list.docs.map((doc) => Item.fromFireStore(doc)).toList());
  }

  static List<Item> minQtyList(List<Item> listItem) {
    List<Item> filterList = List<Item>();
    for (int i = 0; i < listItem.length; i++) {
      Item item = listItem[i];
      if (item.qty < 10) {
        filterList.add(item);
      }
    }
    return filterList;
  }
}
