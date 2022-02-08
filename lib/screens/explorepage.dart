import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp_main/modals/product.dart';
import 'package:ecommerceapp_main/constants/constants.dart';
import 'package:ecommerceapp_main/screens/itempage.dart';
import 'modal_sheet.dart';

class ExplorePage extends StatefulWidget {
  static String id = 'Explore_Page';

  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<dynamic> product = [];

  List<Color> colorsList = [
    Colors.black,
    Colors.redAccent,
    Colors.cyanAccent,
    Colors.pinkAccent,
    Colors.orange
  ];

  Future<void> getProductInfo() async {
    String response = await rootBundle.loadString('assets/product.json');
    var decodeddata = await jsonDecode(response);
    setState(() {
      product = decodeddata['products']
          .map((data) => Product.fromJson(data))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getProductInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey.shade50,
              expandedHeight: 200.0,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(top: 20.0, left: 20.0),
                title: const Center(
                  child: Text(
                    'Best Collections of 2021 ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                ),
                background: Image.network(
                  'https://github.com/afgprogrammer/Flutter-e-commerce-app-example/blob/master/assets/images/background.png?raw=true',
                  fit: BoxFit.fill,
                ),
              ),
              bottom: AppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                backgroundColor: Colors.grey.shade50,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Eg. Cotton Sweatshirt',
                          hintStyle: TextStyle(color: Colors.black38),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: Offset(8, 5))
                        ],
                        borderRadius: BorderRadius.circular(20.0)),
                    height: 300.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              'Popular Products',
                              style: kSubheadingStyle,
                            ),
                            const SizedBox(
                              width: 160.0,
                            ),
                            Text(
                              'See all',
                              style: kSeeAllStyle,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: product.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return productView(
                                product: product,
                                index: index,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1, 2),
                        )
                      ],
                      color: Colors.white,
                    ),
                    height: 250.0,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Winter Wonderland Collection',
                              style: kSubheadingStyle,
                            ),
                            Text(
                              'See all',
                              style: kSeeAllStyle,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.length,
                            itemBuilder: (context, index) {
                              return wintercollection(
                                  product: product, index: index);
                            },
                          ),
                        ),
                      ],
                    ),
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

class productView extends StatelessWidget {
  const productView({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final List product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemPage(product: product[index]),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, top: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2.0,
                  color: Colors.black,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        child: Image.network(
                          product[index].itemurl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.0,
                      bottom: 5.0,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (context)=>ModelSheet(product: product[index]));
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                child: Text(
                  '${product[index].name}',
                  style: kItemNameStyle,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '${product[index].brand}',
                      style: kItemBrandStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      '${product[index].price}₹',
                      style: kItemPriceStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class wintercollection extends StatelessWidget {
  const wintercollection({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final List product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemPage(product: product[index]),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, top: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2.0,
                color: Colors.black,
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        product[index].itemurl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 5.0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${product[index].name}',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  Text(
                    '${product[index].brand}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.amber[500],
                    ),
                  ),
                  Text(
                    '${product[index].price}₹',
                    style: kItemPriceStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
