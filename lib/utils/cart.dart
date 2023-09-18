import 'package:flutter/material.dart';

class cart_page extends StatefulWidget {
  const cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Cart Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              child: Column(children: []),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              color: Colors.red,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "\$ 1440.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
