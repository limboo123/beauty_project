import 'package:beauty/data/details_list.dart';
import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/pages/susseuful%20page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: B,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Gap(50),
                Text(
                  'Payment Method',
                  style: myStyle(30,BG2
                  ),
                ),
              ],
            ),
            Gap(30),
            Container(
                width: double.infinity,
                height: 280,
                child: Image(image: AssetImage("assets/images/Frame 304.png"),fit: BoxFit.cover,)),
            Gap(30),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name on Card',
                    labelStyle: style(15,BG2,FontWeight.bold),
                    filled: true,
                    fillColor: BG,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    labelStyle: style(15,BG2,FontWeight.bold),
                    filled: true,
                    fillColor:BG,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Expiration Date',
                          labelStyle: style(15,BG2,FontWeight.bold),
                          filled: true,
                          fillColor: BG,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'CVC',
                          labelStyle: style(15,BG2,FontWeight.bold),
                          filled: true,
                          fillColor: BG,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
            Gap(30),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false){
                      Get.to(SuccessfulPage(detail1: products[index],));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: BG2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Add Card', style: style(20,Colors.white)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
