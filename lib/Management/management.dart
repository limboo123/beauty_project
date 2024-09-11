import 'package:beauty/model/details.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Management extends GetxController{
  /// for book buying
  int _counter = 0;

  set counter(int value){
    _counter=value;
    update();
  }
  int get counter=>_counter;

  void incrementCounter() {
    _counter++;
    update();
  }

  List<Detail1> _cardProducts=[];

  bool addToCard(Detail1 product){
    if(!_cardProducts.contains(product)){
      _cardProducts.add(product);
      _counter++;
      update();
      return true;
    }
    else{
      return false;
    }
  }

  List<Detail1> get cardProducts=> _cardProducts;

  /// increase of quantity in cart page
  void increaseQuantity(Detail1 product){
    product.quantity++;
    update();
  }
  /// decrease of quantity in cart page
  void decreaseQuantity(Detail1 product){
    if(product.quantity>0){
      product.quantity--;
      update();
    }
  }

}