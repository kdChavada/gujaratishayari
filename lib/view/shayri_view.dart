import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../main.dart';

// ignore: must_be_immutable
class ShayriView extends StatefulWidget {
  int categoryId;
  String categoryName;

  ShayriView({Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  State<ShayriView> createState() => _ShayriViewState();
}

class _ShayriViewState extends State<ShayriView> {
  List contantView = [];

  getData() async {
    contantView = [];
    for (int i = 0; i < dbHelper.contact.length; i++) {
      if (dbHelper.contact[i]['cate_id'] == widget.categoryId) {
        contantView.add(dbHelper.contact[i]);
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 6, 97),
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
          itemCount: contantView.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, i) {
            return viewContainer("${contantView[i]['content']}");
          }),
    );
  }

  //View Container
  Widget viewContainer(String lable) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: w,
      color: const Color.fromARGB(255, 100, 73, 5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              lable,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            const Divider(
              color: Colors.white,
              thickness: 3.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Share.share(lable);
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
