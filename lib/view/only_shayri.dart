import 'package:flutter/material.dart';
import 'package:gujaratishayari/main.dart';
import 'package:share_plus/share_plus.dart';

import '../helper/name_define.dart';

class MixShayri extends StatefulWidget {
  const MixShayri({Key? key}) : super(key: key);

  @override
  State<MixShayri> createState() => _MixShayriState();
}

class _MixShayriState extends State<MixShayri> {
  //Data Get Function
  Future<void> getData() async {
    await onlyShayri.databaseGet();
    setState(() {});
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
          nameOfTitle2,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: onlyShayri.mixShayri.length,
          itemBuilder: (context, index) {
            print(onlyShayri.mixShayri[index]['Shayari']);
            return viewContainer("${onlyShayri.mixShayri[index]['Shayari']}");
          }),
    );
  }

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
