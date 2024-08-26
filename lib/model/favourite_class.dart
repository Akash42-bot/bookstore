import 'package:bookstore/model/book_class.dart';
import 'package:get/get.dart';

class FavouriteClass extends GetxController {
  int counters = 0;
  void incre(){
    counters++;
    update();
  }
}