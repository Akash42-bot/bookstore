import 'package:bookstore/data/droplist.dart';
import 'package:bookstore/model/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'book_class.dart';

class ManageState extends GetxController {
  int _counter = 0;

  set counter(int value) {
    _counter = value;
    update();
  }

  int get counter => _counter;

  void increment() {
    _counter++;                       
    update();
  }

///cart
  List<BookModel>_cartProduct = [];

  bool addtoCart(BookModel product) {
    if (!_cartProduct.contains(product)) {
      _cartProduct.add(product);
      _counter++;
      update();
      return true;
    }
    else {
      return false;
    }
  }

  List<BookModel> get cartProduct => _cartProduct;

  void increaseQuantity(BookModel product) {
    product.quantity++;
   update();
  }

  void decrease(BookModel product) {
    if (product.quantity > 1) {
      product.quantity--;
     update();
    }
    else {

    }
  }

  void delete(BookModel product) {
    _cartProduct.remove(product);
    product.quantity=1;
    _counter--;

    update();
  }
///sub total
  double calculate() {
    double total = 0;
    for (var product in _cartProduct) {
      total = total + product.price * product.quantity;
    }
    return total;
  }

///total
  double amount() {
    double tot = 0;
    for (var product in _cartProduct) {
      tot = tot + product.price * product.quantity ;
    }
    return tot+20;
  }
  ///dark mode
  bool _isLightTheme=true;
  bool get isLightTheme=>_isLightTheme;

  void toggletheme(){
    _isLightTheme=!_isLightTheme;
    update();

  }

  final _formkey = GlobalKey<FormState>();
  get form=>_formkey;

  bool _isOn = false;

  bool get isOn => _isOn;

  void toggle() {
    _isOn = !_isOn;
    update();
  }

  ///dropdown
  PayModel? _selectedPayment;

  PayModel? get selectedPayment => _selectedPayment;

  void selectPayment(PayModel? payment) {
    _selectedPayment = payment;
   update();
  }



// double percent(){
//   double net=calculate();
//   for(var product in _cartProduct){
//     net=calculate()+10;
//   }
//   return net;
// }
}
