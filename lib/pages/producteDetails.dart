import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/model/details.dart';
import 'package:beauty/pages/cart.dart';

class ProductDetails extends StatefulWidget {
  final Detail1 details;

  ProductDetails({super.key, required this.details});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool favorite = false;
  double _rating = 0;
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [BG, BG2],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: BG2, width: 3),
                            ),
                            child: Icon(Icons.arrow_back, color: BG2, size: 33),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              favorite = !favorite;
                            });
                          },
                          child: Icon(
                            favorite ? Icons.favorite : Icons.favorite_border,
                            color: BG2,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: widget.details.quantity,
                       shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Stack(
                            children: [Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${widget.details.name}",
                                        style: myStyle(30, teal, FontWeight.bold),
                                      ),
                                      Gap(10),
                                      Text(
                                        "${widget.details.name2}",
                                        style: style(20, third, FontWeight.bold),
                                      ),
                                      Gap(11),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: Text(
                                          "${widget.details.brife}",
                                          style: style(14, news),
                                          maxLines: 40,
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "${widget.details.payment}",
                                        style: myStyle(22, teal),
                                      ),
                                      Gap(10),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 23,
                                              child: Image.asset(
                                                "assets/images/neg.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Gap(10),
                                          Text(
                                            "${widget.details.quantity}",
                                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                          ),
                                          Gap(10),
                                          Container(
                                            height: 23,
                                            child: Image.asset(
                                              "assets/images/pos.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 20,
                                            initialRating: _rating,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                            itemBuilder: (context, index) => Icon(Icons.star, color: teal),
                                            onRatingUpdate: (rating) {
                                              setState(() {
                                                _rating = rating;
                                              });
                                            },
                                          ),
                                          Gap(10),
                                          Text(
                                            '$_rating',
                                            style: myStyle(18, teal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left:200,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("${widget.details.image}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainContainerBuild("100ml"),
                          Gap(5),
                          MainContainerBuild("250ml"),
                          Gap(5),
                          MainContainerBuild("500ml"),
                          Gap(5),
                          MainContainerBuild("1000ml"),
                        ],
                      ),
                    ),
                    Gap(30),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BG,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Cart(
                                    detail1: widget.details,
                                  ),
                                ));
                              },
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: BG2,
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: third,
                                  size: 36,
                                ),
                              ),
                            ),
                            Gap(50),
                            Center(
                              child: Text(
                                "Free Shipping",
                                style: smallstyle(20, BG2, FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MainContainerBuild(String title) {
    bool isSelected = selected == title;
    return InkWell(
      onTap: () {
        setState(() {
          selected = title;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? BG2 : BG,
          ),
          child: Center(
            child: Text(
              title,
              style: style(15, isSelected ? B : BG2, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
