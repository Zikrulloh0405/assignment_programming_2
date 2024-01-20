import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
    List<Product> products;

    Menu({
        required this.products,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    String categoryOfProduct;
    String nameOfProduct;
    int priceOfProduct;
    List<String> receptOfProduct;
    String descriptionOfProduct;

    Product({
        required this.categoryOfProduct,
        required this.nameOfProduct,
        required this.priceOfProduct,
        required this.receptOfProduct,
        required this.descriptionOfProduct,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoryOfProduct: json["categoryOfProduct"],
        nameOfProduct: json["nameOfProduct"],
        priceOfProduct: json["priceOfProduct"],
        receptOfProduct: List<String>.from(json["receptOfProduct"].map((x) => x)),
        descriptionOfProduct: json["descriptionOfProduct"],
    );

    Map<String, dynamic> toJson() => {
        "categoryOfProduct": categoryOfProduct,
        "nameOfProduct": nameOfProduct,
        "priceOfProduct": priceOfProduct,
        "receptOfProduct": List<dynamic>.from(receptOfProduct.map((x) => x)),
        "descriptionOfProduct": descriptionOfProduct,
    };
}
