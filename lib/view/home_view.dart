import 'package:flutter/material.dart';
import 'package:gujaratishayari/helper/name_define.dart';
import 'package:gujaratishayari/view/shayri_view.dart';
import '../main.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //data Get Function
  Future<void> getData() async {
    await dbHelper.databaseGet();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 6, 97),
        centerTitle: true,
        title: Text(
          nameOfTitle,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: dbHelper.category.length,
            itemBuilder: (context, v) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShayriView(
                        categoryName: "${dbHelper.category[v]["cate_name"]}",
                        categoryId:
                            int.parse("${dbHelper.category[v]["cate_id"]}"),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  width: w,
                  color: const Color.fromARGB(255, 100, 73, 5),
                  child: Center(
                    child: Text(
                      "${dbHelper.category[v]["cate_name"]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
