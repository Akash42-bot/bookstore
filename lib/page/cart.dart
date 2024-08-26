import 'package:bookstore/data/book.dart';
import 'package:bookstore/model/Stateclass.dart';
import 'package:bookstore/model/favourite_class.dart';
import 'package:bookstore/page/billing_point.dart';
import 'package:bookstore/page/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class cart extends StatelessWidget {
  cart({super.key});

  final ManageState ms = Get.find<ManageState>();
  final FavouriteClass fc = Get.find<FavouriteClass>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteClass>(builder: (_) {
      return GetBuilder<ManageState>(builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ms.isLightTheme ? Colors.white : Colors.black,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  color: ms.isLightTheme ? Colors.white : Colors.black,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios,
                              color: ms.isLightTheme
                                  ? Colors.black
                                  : Colors.white)),
                      Text(
                        "  CART",
                        style: TextStyle(
                            color:
                                ms.isLightTheme ? Colors.black : Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  (' '${ms.counter}' ' items' ')',
                        style: TextStyle(
                            fontSize: 17,
                            color:
                                ms.isLightTheme ? Colors.black : Colors.white),
                      )
                    ],
                  ),
                )),
            body: Column(
              children: [
                ms.cartProduct.isEmpty
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.8032,
                        child: Center(
                            child: Image.asset('assets/images/carts.jpg')))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: ms.cartProduct.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ms.isLightTheme
                                          ? Colors.black
                                          : Colors.white)),
                              child: Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Hero(
                                                    tag:
                                                        '${ms.cartProduct[index].name}',
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  '${ms.cartProduct[index].img}'),
                                                              fit: BoxFit
                                                                  .scaleDown)),
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              ms.decrease(
                                                                  ms.cartProduct[
                                                                      index]);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 30,
                                                              color:
                                                                  ms.isLightTheme
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .white,
                                                            )),
                                                        Text(
                                                          ' ${ms.cartProduct[index].quantity} ',
                                                          style: TextStyle(
                                                              fontSize: 30,
                                                              color: ms
                                                                      .isLightTheme
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              ms.increaseQuantity(
                                                                  ms.cartProduct[
                                                                      index]);
                                                            },
                                                            child: Icon(
                                                                Icons.add,
                                                                size: 30,
                                                                color: ms
                                                                        .isLightTheme
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white))
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${ms.cartProduct[index].name}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: ms.isLightTheme
                                                        ? Colors.black
                                                        : Colors.white),
                                              ),
                                              Text(
                                                'Published : '
                                                '${ms.cartProduct[index].date}',
                                                style: TextStyle(
                                                    color: ms.isLightTheme
                                                        ? Colors.black
                                                        : Colors.white),
                                              ),
                                              SizedBox(height: 20),
                                              Text(
                                                '\$'
                                                "${ms.cartProduct[index].price}",
                                                style: TextStyle(
                                                    color: ms.isLightTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        ms.delete(
                                                            ms.cartProduct[
                                                                index]);
                                                      },
                                                      child: Icon(
                                                          Icons
                                                              .delete_outline_outlined,
                                                          size: 30,
                                                          color: ms.isLightTheme
                                                              ? Colors.black
                                                              : Colors.white)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Column(
                  children: [
                    ms.cartProduct.isNotEmpty
                        ? Container(
                            padding: EdgeInsets.all(10),
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              children: [
                                Text(
                                  "Total- " '\$' '${ms.calculate()}',
                                  style: TextStyle(
                                      color: ms.isLightTheme
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(bill(),
                                        transition: Transition.downToUp);
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orangeAccent,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Proceed to Check out',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),

              ],
            ),
          ),
        );
      });
    });
  }
}
