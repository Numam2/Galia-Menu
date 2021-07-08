class Products {
  String product;
  double price;
  String image;
  String category;
  String description;
  bool available;
  int time;
  bool vegan;
  List<PriceOptions> priceOptions;

  Products(this.product, this.price, this.image, this.description,
      this.category, this.available, this.time, this.vegan, this.priceOptions);
}

class PriceOptions {
  String option;
  double price;

  PriceOptions(this.option, this.price);
}
