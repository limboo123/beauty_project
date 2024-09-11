import 'package:beauty/Management/binding.dart';
import 'package:beauty/Management/management.dart';
import 'package:beauty/pages/Beauty.dart';
import 'package:beauty/pages/producteDetails.dart';
import 'package:beauty/pages/products.dart';
import 'package:beauty/pages/home.dart';
import 'package:beauty/parctice_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/beauty',
      getPages: [
        GetPage(
          name: '/beauty',
          page: ()=>Beauty(),
        ),
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: Beauty(),
    );
  }
}

