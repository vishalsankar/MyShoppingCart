
class Product{
  String name;
  String itemurl;
  String brand;
  int price;
  Product(this.name,this.itemurl,this.brand,this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json["name"],
        json["itemurl"],
        json["brand"],
        json["price"]
    );
  }
}