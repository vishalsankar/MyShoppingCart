import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceapp_main/modals/product_cart.dart';
import 'package:ecommerceapp_main/modals/product.dart';


class ModelSheet extends StatefulWidget {
  final Product product;
  ModelSheet({required this.product});

  @override
  _ModelSheetState createState() => _ModelSheetState();
}

class _ModelSheetState extends State<ModelSheet> {

  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  int _selectedsize = 1;

  final List<Color> colorsList = [
    Colors.black,
    Colors.red,
    Colors.cyanAccent,
    Colors.pinkAccent,
    Colors.yellow.shade800,
  ];

  int _selectedcolor = 0;

  @override

  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575).withOpacity(1),
      height: MediaQuery.of(context).size.height*0.4,
      child: Container(
        padding: EdgeInsets.only(left:10.0,right: 10.0,top: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick Color',
              style: TextStyle(
                height: 1.5,
                color: Colors.black,
                fontSize: 20.0,
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
                    fontSize: 20.0,
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
    );
  }
}
