import 'package:e_com_app/utils/Global.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  int? dropdownvalue;
  double? sliderval;
  int start = 0;
  int end = 1000;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed('third');
              });
            },
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        title: const Text('Home Page', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: (dropdownvalue != null)
                    ? Column(
                        children: [
                          Row(
                            children: [
                              DropdownButton(
                                value: dropdownvalue,
                                hint: const Text("Select Category..."),
                                items: global.allProducts.map(
                                  (e) {
                                    return DropdownMenuItem(
                                      value: global.allProducts.indexOf(e),
                                      child: Text("${e['CategoryName']}"),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(
                                    () {
                                      dropdownvalue = val!;
                                    },
                                  );
                                },
                              ),
                              Visibility(
                                visible: (dropdownvalue != null) ? true : false,
                                child: ActionChip(
                                  label: const Row(
                                    children: [
                                      Icon(Icons.clear, size: 15),
                                      Text(
                                        'Clear',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      dropdownvalue = null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(" From \n    $start"),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: RangeSlider(
                                values: RangeValues(
                                  start.toDouble(),
                                  end.toDouble(),
                                ),
                                max: 1000,
                                min: 0,
                                onChanged: (val) {
                                  setState(() {
                                    start = val.start.toInt();
                                    end = val.end.toInt();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text("  TO \n $end "),
                              ),
                            ),
                          ]),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              DropdownButton(
                                value: dropdownvalue,
                                hint: const Text("Select Category..."),
                                items: global.allProducts.map(
                                  (e) {
                                    return DropdownMenuItem(
                                      value: global.allProducts.indexOf(e),
                                      child: Text("${e['CategoryName']}"),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(
                                    () {
                                      dropdownvalue = val!;
                                    },
                                  );
                                },
                              ),
                              Visibility(
                                visible: (dropdownvalue != null) ? true : false,
                                child: ActionChip(
                                  label: const Row(
                                    children: [
                                      Icon(Icons.clear, size: 15),
                                      Text(
                                        'Clear',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      dropdownvalue = null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            Expanded(
              flex: (dropdownvalue == null) ? 9 : 6,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: global.allProducts.map(
                    (e) {
                      List data = e['data'];

                      return (dropdownvalue == null)
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              width: 400,
                              height: 370,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${e['CategoryName']}",
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ...data.map(
                                          (e) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                      'second',
                                                      arguments: e,
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: 190,
                                                height: 290,
                                                margin:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 0.1,
                                                      spreadRadius: 0.1,
                                                      offset: Offset(1, 1),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                "${e['thumbnail']}"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          width: 65,
                                                          height: 34,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .red
                                                                      .shade800,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            07),
                                                                  )),
                                                          child: Center(
                                                            child: Text(
                                                              '${e['discountPercentage']}%',
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${e['title']}',
                                                              style:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$ ${e['price']}',
                                                              style:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            RatingBar.builder(
                                                              initialRating: 3,
                                                              minRating: 1,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 5,
                                                              ignoreGestures:
                                                                  true,
                                                              itemSize: 18,
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              onRatingUpdate:
                                                                  (rating) {
                                                                // print(rating);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : (dropdownvalue == global.allProducts.indexOf(e)
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 400,
                                  height: 370,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e['CategoryName']}",
                                        style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ...data.map(
                                              (e) {
                                                return (e['price'] >= start &&
                                                    e['price'] <= end) ? GestureDetector(
                                                  onTap: () {
                                                    setState(
                                                      () {
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                          'second',
                                                          arguments: e,
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 190,
                                                    height: 290,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color: Colors.white,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 0.1,
                                                          spreadRadius: 0.1,
                                                          offset: Offset(1, 1),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20),
                                                              ),
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    "${e['thumbnail']}"),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Container(
                                                              width: 65,
                                                              height: 34,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .red
                                                                          .shade800,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(10),
                                                                        bottomRight:
                                                                            Radius.circular(07),
                                                                      )),
                                                              child: Center(
                                                                child: Text(
                                                                  '${e['discountPercentage']}%',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${e['title']}',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '\$ ${e['price']}',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                RatingBar
                                                                    .builder(
                                                                  initialRating:
                                                                      3,
                                                                  minRating: 1,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  allowHalfRating:
                                                                      true,
                                                                  itemCount: 5,
                                                                  ignoreGestures:
                                                                      true,
                                                                  itemSize: 18,
                                                                  itemBuilder:
                                                                      (context,
                                                                              _) =>
                                                                          const Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                  onRatingUpdate:
                                                                      (rating) {
                                                                    // print(rating);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ) : Container();
                                              },
                                            ).toList(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container());
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
