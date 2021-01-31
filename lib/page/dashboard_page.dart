import 'package:flutter/material.dart';
import 'package:myshirt/model/item.dart';
import 'package:myshirt/page/edit_item_page.dart';
import 'package:myshirt/widget/card_item.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Item> listItem = Provider.of<List<Item>>(context);
    //List<Item> listItem = ItemProvider.minQtyList(Provider.of<List<Item>>(context));

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 25,
        ),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.add_outlined),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditItemPage(
                            item: null,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Container(
              height: 260,
              padding: EdgeInsets.all(5),
              color: Colors.blue,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: listItem.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return InkWell(
                      child: CardItem(item: listItem[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditItemPage(
                              item: listItem[index],
                              id: listItem[index].id,
                            ),
                          ),
                        );
                      });
                },
                separatorBuilder: (BuildContext buildContext, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
              // child: StreamBuilder(
              //   stream:
              //       FirebaseFirestore.instance.collection('item').where('qty', isGreaterThan: 10).snapshots(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (!snapshot.hasData) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //     return ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: snapshot.data.docs.map((document) {
              //         Item item = Item(
              //           id: document['id'],
              //           name: document['name'],
              //           image: document['image'],
              //           desc: document['desc'],
              //           qty: document['qty'],
              //           status: document['status'],
              //         );
              //         return InkWell(
              //           child: CardItem(item: item),
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => EditItemPage(
              //                   item: item,
              //                   id: document.id,
              //                 ),
              //               ),
              //             );
              //           },
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
