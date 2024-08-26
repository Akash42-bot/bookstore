import 'package:bookstore/data/book.dart';
import 'package:bookstore/model/Stateclass.dart';
import 'package:bookstore/model/book_class.dart';
import 'package:bookstore/page/Imports.dart';
import 'package:bookstore/page/cart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/favourite_class.dart';


class books extends StatelessWidget {
  books({super.key});

  final ManageState ms = Get.find<ManageState>();
  final FavouriteClass fc = Get.find<FavouriteClass>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<FavouriteClass>(builder: (_) {
        return GetBuilder<ManageState>(builder: (_) {
          return Scaffold(
            drawer: Drawer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        Container(
                          height: 200,
                          width: 304,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/c.jpg'),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Positioned(
                            left: 80,
                            top: 130,
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/p.jpg'),
                                      fit: BoxFit.cover),
                                  border: Border.all(color: Colors.black)),
                            )),
                        Positioned(
                          left: 50,
                          top: 270,
                          child: Container(
                            width: 200,
                            height: 70,
                            child: Column(
                              children: [
                                Text(
                                  'Ryan Steven',
                                  style: mystyle(
                                      20, Colors.black, FontWeight.bold),
                                ),
                                Text('ryansteven43@gmail.com')
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 340,
                            child: Container(
                              height: 400,
                              width: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text("Home"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("Profile"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.favorite),
                                    title: Text("Favourites"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.logout),
                                    title: Text("Log out"),
                                  ),
                                  Gap(100),
                                ],
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 650, left: 15),
                          child: Row(
                            children: [
                              ms.isLightTheme
                                  ? Icon(Icons.sunny)
                                  : Icon(Icons.nightlight),
                              Gap(20),
                              Switch(
                                  value: !ms.isLightTheme,
                                  onChanged: (value) {
                                    ms.toggletheme();
                                  }),
                            ],
                          ),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: ms.isLightTheme ? Colors.white : Colors.black,
            appBar: AppBar(
              backgroundColor: ms.isLightTheme ? Colors.white : Colors.black,
              title: Text('Good Reads',
                  style: GoogleFonts.greyQo(
                    color: ms.isLightTheme ? Colors.black : Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
              centerTitle: true,
              actions: [
                Stack(clipBehavior: Clip.none, children: [
                  Icon(
                    Icons.favorite_outline_outlined,
                    size: 30,
                  ),
                  Positioned(
                    left: 14,
                    top: -5,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                          child: Text(
                        '${fc.counters}',
                        style: mystyle(15, Colors.white),
                      )),
                    ),
                  )
                ]),
                Gap(5),
                InkWell(
                  onTap: () {
                    Get.to(
                      cart(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: Stack(clipBehavior: Clip.none, children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: ms.isLightTheme ? Colors.black : Colors.white,
                      size: 30,
                    ),
                    Positioned(
                        left: 17,
                        top: -5,
                        child: ms.cartProduct.isNotEmpty
                            ? Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Center(
                                    child: Text(
                                  '${ms.counter}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            : Container())
                  ]),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover Your',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ms.isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                    Text(
                      'Best Books Now',
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ms.isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                    Gap(10),
                    Text(
                      'Find your dream book according to your preferences ',
                      style: TextStyle(
                        color: ms.isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                    Text(
                      'and join to our family. What are you searching for.',
                      style: TextStyle(
                        color: ms.isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                    Gap(20),
                    Row(
                      children: [
                        SizedBox(
                          width: 310,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: 'Search for a book',
                                filled: true,
                                fillColor: ms.isLightTheme
                                    ? Colors.white
                                    : Colors.black,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Gap(10),
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orangeAccent,
                            ),
                            child: Icon(
                              Icons.tune,
                              color:
                                  ms.isLightTheme ? Colors.black : Colors.white,
                            ))
                      ],
                    ),
                    Gap(30),
                    Text('ALL BOOKS',
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ms.isLightTheme ? Colors.black : Colors.white,
                        )),
                    Gap(10),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: booked.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          color: ms.isLightTheme ? Colors.white : Colors.black,
                          shadowColor:
                              ms.isLightTheme ? Colors.black : Colors.white,
                          child: Container(
                              child: Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Card(
                                      child: Hero(
                                        tag: '${booked[index].name}',
                                        child: Container(
                                          width: 130,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      '${booked[index].img}'),
                                                  fit: BoxFit.fill)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Stack(clipBehavior: Clip.none,
                                                children: [Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black
                                                              .withOpacity(1)),
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffe9c46a)),
                                                  child: Center(
                                                      child: Text(
                                                    '\$' '${booked[index].price}',
                                                    style: TextStyle(
                                                        color: ms.isLightTheme
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                                  Positioned(
                                                    top: -150,
                                                    child: Container(height: 40,width: 40,decoration:
                                                        BoxDecoration(shape: BoxShape.circle,color: Colors.grey),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                      InkWell(
                                                          onTap: (){
                                                            fc.incre();
                                                          },
                                                          child: Icon(Icons.favorite_outline_outlined,size: 30,))
                                                    ],),
                                                    ),
                                                  )
                                             ] ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${booked[index].name}',
                                            style: TextStyle(
                                                color: ms.isLightTheme
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${booked[index].author}',
                                            style: TextStyle(
                                                color: ms.isLightTheme
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ms.increment();
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                bool added =
                                                    ms.addtoCart(booked[index]);
                                                if (added) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            'Book have been added')
                                                    ),
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Book have been already added")));
                                                }
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.orangeAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                    child: Text(
                                                  'Add to Cart',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
