import 'package:e_com_app/utils/Global.dart';
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
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed("/");
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...global.cartProducts.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            Navigator.of(context).pushNamed(
                              'second',
                              arguments: e,
                            );
                          },
                        );
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: height / 7,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: height / 7,
                                  child: Image.network(e['thumbnail']),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e['title']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "\$ ${e['price']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            global.cartProducts.remove(e);
                                            global.totalPrice -= e['price'];
                                            global.getqty--;
                                          });
                                        },
                                        child: const Text(
                                          "DELETE",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 19,
                                            fontWeight: FontWeight.normal,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
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
              child: Row(
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
                      "\$ ${global.totalPrice}",
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
