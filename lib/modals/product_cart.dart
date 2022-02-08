import 'package:flutter/material.dart';
import 'product.dart';

class CartProduct extends ChangeNotifier{
  List<Product> cartItems=[];
  List<int> itemCount=[];
  Map<Product,int> itemCounter={};

  void addItemtoCart(Product product){
    if(cartItems.contains(product)){
      itemCount[cartItems.indexOf(product)]=itemCount[cartItems.indexOf(product)]+1;
      itemCounter[product]=1;
    }else{
      final Product prod=product;
      cartItems.add(prod);
      itemCount.add(1);
    }
    notifyListeners();
  }

  int productCount(int index){
    return itemCount[index];
  }

  int get cartItemsCount{
    return cartItems.length;
  }
  
  int get totalPrice{
    int totalprice=0;
    for (var i in cartItems){
      totalprice+=itemCount[cartItems.indexOf(i)]*i.price;
    }
    return totalprice;
  }

  void deleteItemsfromCart(int index){
    cartItems.removeAt(index);
    itemCount.removeAt(index);
    notifyListeners();
  }
}