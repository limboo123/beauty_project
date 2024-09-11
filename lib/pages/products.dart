import 'package:beauty/data/details_list.dart';
import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/pages/producteDetails.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String? selectedProduct;
  int? selectedLipstickIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [BG, BG2]
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/image/funny-cat.webp")),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tom", style: myStyle(30, BG2),),
                                Text("Tom@gmail.com", style: smallstyle(20, BG2),),
                              ],
                            ),
                          ],
                        ),
                        Stack(children:[
                          Icon(Icons.notifications_none_sharp,color: BG2,size: 36,),
                          Positioned(
                            top: 4,
                              right: 8,
                              child: CircleAvatar(
                                maxRadius: 5,
                                backgroundColor: BG2,))
                        ]),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 48,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BG2.withOpacity(0.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.search, color: BG, size: 27,),
                                  SizedBox(width: 10,),
                                  Text("Search", style: style(18, BG),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Best Products", style: style(25, BG2, FontWeight.bold),),
                    Gap(10),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ProductDetails(details: products[index],)));
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Card(
                                    margin: EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19),
                                    ),
                                    child: Container(
                                      width: 240,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: BG
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(13),
                                              height: 84,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: BG2,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                          width: MediaQuery.of(context).size.width * 0.4,
                                                          child: Text("${products[index].name}", style: style(19, third, FontWeight.bold), maxLines: 3,)),
                                                      Text("${products[index].payment}", style: style(17, third, FontWeight.bold),),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                          width: MediaQuery.of(context).size.width * 0.4,
                                                          child: Text("${products[index].name2}", style: style(15, third), maxLines: 3,)
                                                      ),
                                                      Gap(10),
                                                      Container(
                                                          height: 23,
                                                          child: Image(image: AssetImage("assets/image/bxs-plus-circle.svg.png"), fit: BoxFit.cover,)
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -3,
                                    left: 20,
                                    child: Container(
                                      height: 150,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("${products[index].image}"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Gap(15),
                    SizedBox(
                      height: 60,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          MainContainerbuild("Primer"), Gap(5),
                          MainContainerbuild("Lipstick"), Gap(5),
                          MainContainerbuild("Mascara"), Gap(5),
                          MainContainerbuild("Blush"), Gap(5),
                          MainContainerbuild("Concealer"), Gap(5),
                          MainContainerbuild("Eyeshadow"), Gap(5),
                          MainContainerbuild("Foundation"), Gap(5),
                          MainContainerbuild("Brush"),
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: lip.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedLipstickIndex == index;
                          return Stack(
                            clipBehavior: Clip.none,
                            children:[ GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedLipstickIndex = index;
                                });
                              },
                              child: Card(
                                margin: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                color: isSelected ? BG2 : BG,
                                child: Container(
                                  height: 77,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: isSelected ? BG2 : BG,  // Set container color based on selection
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Gap(70),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${lip[index].name}",
                                                style: style(20, isSelected ? B : BG2, FontWeight.bold),  // Change text color based on selection
                                              ),
                                              Gap(10),
                                              Text(
                                                "${lip[index].quen}",
                                                style: style(16, isSelected ? B.withOpacity(0.6) : BG2.withOpacity(0.6)),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: 23,
                                                    child: Image(image: AssetImage("assets/images/bxs-plus-circle.svg (1).png"), fit: BoxFit.cover,)
                                                ),
                                                Gap(10),
                                                Text(
                                                  "${lip[index].payment}",
                                                  style: style(16, isSelected ? B : BG2, FontWeight.bold),  // Change text color based on selection
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                              Positioned(
                                top: -70,
                                left: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 225,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("${lip[index].image}"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ]
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MainContainerbuild(String title) {
    bool isSelected = selectedProduct == title;
    return InkWell(
      onTap: () {
        setState(() {
          selectedProduct = title;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: isSelected ? BG2 : BG,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                color: isSelected ? B : BG2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
