import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/model/details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SuccessfulPage extends StatelessWidget {
  Detail1 detail1;
  SuccessfulPage({super.key,required this.detail1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: B,
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){Get.back();},
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: BG2,width: 4)
                  ),
                  child: Icon(Icons.arrow_back,color:BG2,size: 35,),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Congratulations',
              style: myStyle(35,BG2),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              'You Have Purchase Successfully',
              style: myStyle(25, BG2,),
            ),
          ),
          SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 400,
              child: Image.asset('${detail1.image}')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: BG2
              ),
              child: Center(
                child: Text(
                  'Order',
                  style: style(19, Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
                foregroundColor: BG2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: BG2,
                    width: 5.0,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Continue Shopping',
                  style: style(19,BG2,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

