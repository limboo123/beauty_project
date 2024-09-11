import 'package:beauty/Management/favorite.dart';
import 'package:beauty/Management/management.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<Management>(Management());
    Get.put<Favorite>(Favorite());
  }

}