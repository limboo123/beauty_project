import 'package:beauty/goggle_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pickAll = false;
  bool isPrimerSelected = false;
  bool isLipstickSelected = false;
  bool isMascaraSelected = false;
  bool isBlushSelected = false;
  bool isConcealerSelected = false;
  bool isEyeshadowSelected = false;
  bool isFoundationSelected = false;
  bool isBrushSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: B,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/images/gowent.png"),fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Text("Pick Your Beauty Products", style: myStyle(30,BG2)),
            SizedBox(height: 10),
            Text("Can pick more than one", style: style(23, BG2.withOpacity(0.9))),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                setState(() {
                  pickAll = !pickAll;
                  isPrimerSelected = pickAll;
                  isLipstickSelected = pickAll;
                  isMascaraSelected = pickAll;
                  isBlushSelected = pickAll;
                  isConcealerSelected = pickAll;
                  isEyeshadowSelected = pickAll;
                  isFoundationSelected = pickAll;
                  isBrushSelected = pickAll;
                });
              },
              child: Row(
                children: [
                  Card(
                    color: pickAll ? BG2 : BG,
                    child: Container(
                      height: 25,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: BG2, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text("Pick All", style: style(25,BG2)),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildProductContainer(
                  "Lipstick",
                  "assets/image/lipstick.png",
                  isPrimerSelected,
                      () {
                    setState(() {
                      isPrimerSelected = !isPrimerSelected;
                    });
                  },
                ),
                buildProductContainer(
                  "Perfume",
                  "assets/image/perfume.png",
                  isLipstickSelected,
                      () {
                    setState(() {
                      isLipstickSelected = !isLipstickSelected;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildProductContainer(
                  "Serum",
                  "assets/image/Serum.png",
                  isMascaraSelected,
                      () {
                    setState(() {
                      isMascaraSelected = !isMascaraSelected;
                    });
                  },
                ),
                buildProductContainer(
                  "Shampoo",
                  "assets/image/shampoo.png",
                  isBlushSelected,
                      () {
                    setState(() {
                      isBlushSelected = !isBlushSelected;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildProductContainer(
                  "sunscreen",
                  "assets/image/sun.png",
                  isConcealerSelected,
                      () {
                    setState(() {
                      isConcealerSelected = !isConcealerSelected;
                    });
                  },
                ),
                buildProductContainer(
                  "Foundation",
                  "assets/image/foundation.png",
                  isEyeshadowSelected,
                      () {
                    setState(() {
                      isEyeshadowSelected = !isEyeshadowSelected;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildProductContainer(
                  "Eyeliner",
                  "assets/image/eye.png",
                  isFoundationSelected,
                      () {
                    setState(() {
                      isFoundationSelected = !isFoundationSelected;
                    });
                  },
                ),
                buildProductContainer(
                  "Eyeshadow",
                  "assets/products/goddess_eyeshadow_palette-removebg-preview.png",
                  isBrushSelected,
                      () {
                    setState(() {
                      isBrushSelected = !isBrushSelected;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductContainer(String title, String imagePath, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 160,
        decoration: BoxDecoration(
          color: isSelected ? BG2 : B,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: BG2, width: 3),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 45,
              child: Image.asset(imagePath),
            ),
            Text(title, style: style(18,isSelected ? Colors.white : BG2)),
          ],
        ),
      ),
    );
  }
}
