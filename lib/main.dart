import 'package:e_com_app/utils/Global.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        title: const Text('Home Page', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Container(
                    width: 185,
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text('Select category...'),
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...allProducts.map((e) {
                    List data = e['data'];

                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: 400,
                      height: 310,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${e['CatogeryName']}",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...data.map(
                                  (e) {
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${e['title']}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${e['price']}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                              ),
                                              padding: EdgeInsets.all(10),
                                            ),
                                            flex: 1,
                                          ),
                                        ],
                                      ),
                                      width: 150,
                                      height: 240,
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 0.1,
                                            offset: Offset(2, 1),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
