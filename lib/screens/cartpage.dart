import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp_main/modals/product_cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:
            Container(
                    height: 50.0,
                    color: Colors.white,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0)),
                          boxShadow: [BoxShadow(blurRadius: 2.0)]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Total Price: ',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            Provider.of<CartProduct>(context)
                                    .totalPrice
                                    .toString() +
                                '.00₹',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.1,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(top: 20.0, left: 20.0),
                title: const Center(
                  child: Text(
                    'CART',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                background: Image.network(
                  'https://github.com/afgprogrammer/Flutter-e-commerce-app-example/blob/master/assets/images/background.png?raw=true',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Divider(
                    color: Colors.grey.shade500,
                    thickness: 8.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Provider.of<CartProduct>(context).cartItemsCount > 0
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: Provider.of<CartProduct>(context)
                                .cartItemsCount,
                            itemBuilder: (context, index) {
                              int itemCount = Provider.of<CartProduct>(context)
                                  .productCount(index);
                              int itemPrice = Provider.of<CartProduct>(context)
                                      .cartItems[index]
                                      .price *
                                  itemCount;
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Image.network(
                                        Provider.of<CartProduct>(context)
                                            .cartItems[index]
                                            .itemurl,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      width: 220.0,
                                    ),
                                    Column(
                                      children: [
                                        Text(Provider.of<CartProduct>(context)
                                            .cartItems[index]
                                            .name),
                                        const Text('Quantity'),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (itemCount == 1) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                      title: const Text(
                                                          'Are you sure you want to remove the following item'),
                                                      content: Image.network(
                                                        Provider.of<CartProduct>(
                                                                context)
                                                            .cartItems[index]
                                                            .itemurl,
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              const Text('No'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              Provider.of<CartProduct>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .itemCount[index]--;
                                                              // totalPrice+=Provider.of<CartProduct>(context).cartItems[0].price*itemCount;
                                                            });
                                                            Provider.of<CartProduct>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .deleteItemsfromCart(
                                                                    index);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Yes'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  setState(() {
                                                    Provider.of<CartProduct>(
                                                            context,
                                                            listen: false)
                                                        .itemCount[index]--;
                                                    // totalPrice+=Provider.of<CartProduct>(context).cartItems[0].price*itemCount;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(itemCount.toString()),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  Provider.of<CartProduct>(
                                                          context,
                                                          listen: false)
                                                      .itemCount[index]++;
                                                  // totalPrice+=Provider.of<CartProduct>(context).cartItems[0].price*itemCount;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(itemPrice.toString() + '.00₹'),
                                  ],
                                ),
                              );
                            },
                          )
                        : const Center(child: Text('No Items to See here :(')),
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
