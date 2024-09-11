import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/model/details.dart';
import 'package:beauty/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class Cart extends StatefulWidget {
  Detail1 detail1;
  Cart({super.key,required this.detail1});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: B, // Light green background
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
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
                Gap(120),
                Text(
                  'Cart',
                  style: myStyle(40, BG2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Card(
              color: BG, // Card background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(70),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.detail1.name}", style: myStyle(25, BG2,),),
                          Text("${widget.detail1.name2}", style: style(20, BG2.withOpacity(0.7)),),
                          Row(
                            children: [
                              Container(
                                  height: 23,
                                  child: Image(image: AssetImage("assets/images/neg.png"), fit: BoxFit.cover,)
                              ),
                              Gap(10),
                              Text(
                                "${widget.detail1.quantity}",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              Container(
                                  height: 23,
                                  child: Image(image: AssetImage("assets/images/pos.png"), fit: BoxFit.cover,)
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.close,color: BG2,),
                          Text("500ml",style: style(20,BG2.withOpacity(0.7)),),
                          Text("${widget.detail1.payment}", style: myStyle(22, BG2),),
                        ],
                      ),
                    ],
                  ),
                    Positioned(
                      top: -90,
                      left: -4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 225,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("${widget.detail1.image}"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Payment()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: BG2, // Button color
                minimumSize: Size(double.infinity, 50), // Full width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Check Out',
                style: style(19, Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
