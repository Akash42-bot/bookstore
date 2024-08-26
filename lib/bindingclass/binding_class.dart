import 'package:bookstore/model/Stateclass.dart';
import 'package:bookstore/model/favourite_class.dart';
import 'package:get/get.dart';

class BindingClass extends  Bindings{
  @override
  void dependencies() {
   Get.put<ManageState>(ManageState());
   Get.put<FavouriteClass>(FavouriteClass());
  }
}