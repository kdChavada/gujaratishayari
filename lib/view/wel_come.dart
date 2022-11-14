import 'package:flutter/material.dart';
import 'package:gujaratishayari/view/home_view.dart';
import 'package:gujaratishayari/view/only_shayri.dart';

class WelComeView extends StatefulWidget {
  const WelComeView({super.key});

  @override
  State<WelComeView> createState() => _WelComeViewState();
}

class _WelComeViewState extends State<WelComeView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 6, 97),
        centerTitle: true,
        title: const Text(
          "Welcome",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
/*Start Gujrati Shayri*/
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            },
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 100, 73, 5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                  child: Text(
                "Gujrati shayri",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )),
            ),
          ),
          /*End Gujrati Shayri*/
          SizedBox(
            height: h * 0.05,
          ),
/* Start Mixed Shyri Part*/
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MixShayri(),
                ),
              );
            },
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 100, 73, 5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Mix shayri",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
/* End Mixed Shyri Part*/
        ]),
      ),
    );
  }
}
