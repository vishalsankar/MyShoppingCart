import 'package:ecommerceapp_main/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp_main/modals/product.dart';
import 'package:ecommerceapp_main/modals/product_cart.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final Product product;
  const ItemPage({required this.product});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  int _selectedsize = 1;

  List<Color> colorsList = [
    Colors.black,
    Colors.red,
    Colors.cyanAccent,
    Colors.pinkAccent,
    Colors.yellow.shade800,
  ];

  int _selectedcolor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            floating: true,
            stretch: true,
            snap: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Image.network(
                widget.product.itemurl,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: Transform.translate(
                offset: const Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Container(
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 15.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.product.brand,
                              style: kItemBrandStyle.copyWith(fontSize: 20.0),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          widget.product.price.toString() + '.00₹',
                          style: kItemPriceStyle.copyWith(fontSize: 20.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Take a break from jeans with the parker long straight pant. These lightweight, pleat front pants feature a flattering high waist and loose, straight legs.",
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.grey.shade800,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Pick Color',
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                        Container(
                          height: 60.0,
                          child: ListView.builder(
                            itemCount: colorsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedcolor = index;
                                  });
                                },
                                child: AnimatedContainer(
                                    width: 40.0,
                                    margin: EdgeInsets.only(left: 10.0),
                                    duration: Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                        color: _selectedcolor == index
                                            ? colorsList[index].withOpacity(0.5)
                                            : colorsList[index],
                                        shape: BoxShape.circle),
                                    child: _selectedcolor == index
                                        ? const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                          )
                                        : Container()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Pick Size',
                              style: TextStyle(
                                height: 1.5,
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Size Chart',
                                style: TextStyle(
                                  height: 1.5,
                                  color: Colors.grey.shade800,
                                  fontSize: 15.0,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 60.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedsize = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  width: 40.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                      color: _selectedsize == index
                                          ? Colors.amber[500]
                                          : Colors.white,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      sizeList[index],
                                      style: _selectedsize == index
                                          ? const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)
                                          : const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Container(
                            width: 200.0,
                            child: TextButton(
                              onPressed: () {
                                Provider.of<CartProduct>(context,listen: false).addItemtoCart(widget.product);

                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.shopping_cart,color: Colors.white,),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                        fontSize: 18.0, fontWeight: FontWeight.w500,color: Colors.white),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

