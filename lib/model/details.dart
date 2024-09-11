class Detail1{
  String image;
  String name;
  String payment;
  String brife;
  String name2;
  int quantity;
  String rating;
  bool fav;

  Detail1({
   required this.image,
    required this.name,
    required this.payment,
    required this.brife,
    required this.name2,
    required this.quantity,
    required this.rating,
    this.fav=false,
});
}

class Detail2{
  String image;
  String name;
  String payment;
  String brife;
  String quen;

  Detail2({
    required this.image,
    required this.name,
    required this.payment,
    required this.brife,
    required this.quen,
  });
}