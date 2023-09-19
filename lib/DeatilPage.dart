import 'package:e_com_app/utils/Global.dart';
import 'package:flutter/material.dart';

class detail_page extends StatefulWidget {
  const detail_page({super.key});

  @override
  State<detail_page> createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> d =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

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
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed('third');
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const Alignment(0, -1),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      "${global.getqty}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
        title: const Text(
          "Detail Page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            global.cartProducts.add(d);
            global.getqty++;
            global.totalPrice = global.TotalPrice();
          });
        },
        child: const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 27,
            child: Icon(
              Icons.shopping_cart_checkout_rounded,
              color: Colors.white,
            )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              '${d['images']}',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: height / 2.6,
              width: width / 1,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      // blurStyle: BlurStyle.outer,
                      spreadRadius: 0,
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, -4)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${d['title']}",
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      //   SizedBox(width: 160),
                      Text(
                        "\$ ${d['price']}",
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Headphone",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      //       SizedBox(width: 310),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            "${d['rating']}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Brand",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${d['brand']}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stock",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${d['stock']}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 70,
                            width: 350,
                            child: Text(
                              "${d['description']}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
