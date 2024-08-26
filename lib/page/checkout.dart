import 'package:bookstore/data/Loginlist.dart';
import 'package:bookstore/model/Loginmodel.dart';
import 'package:bookstore/model/Stateclass.dart';
import 'package:bookstore/page/billing_point.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {

  TextEditingController _fullname = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _dzongkhag = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _roadname = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    Text(
                      ' Add Delivery Address',
                      style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                            key:ms.form,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _fullname,
                                  decoration: InputDecoration(
                                    label: Text('Full Name (Required)'),
                                    hintText: 'Full name',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'name not mentioned';
                                    }
                                  },
                                ),
                                Gap(30),
                                TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    label: Text('Email (Required)'),
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email required ';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _phonenumber,
                                  decoration: InputDecoration(
                                    label: Text('Phone Number (Required)'),
                                    hintText: 'Phone Number',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Number required ';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _pincode,
                                  decoration: InputDecoration(
                                    label: Text('Pincode (Required)'),
                                    hintText: 'Pincode',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'pincode required';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _dzongkhag,
                                  decoration: InputDecoration(
                                    label: Text('Dzongkhag (Required)'),
                                    hintText: 'Dzongkhag',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Dzongkhang not added';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _city,
                                  decoration: InputDecoration(
                                    label: Text('City (Required)'),
                                    hintText: 'City',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'city not mentioned';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  controller: _roadname,
                                  decoration: InputDecoration(
                                    label: Text('House No.,Building,Area (Required)'),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'contain not filled';
                                    }
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.orangeAccent,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        ms.toggle();
                        if (ms.form.currentState!.validate()) {
                          final checkout = SnackBar(
                            content: Text('address added'),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(checkout);
                          add.add(Loginmodel(
                              fullname: _fullname.text.toString(),
                              email: _email.text.toString(),
                              phonenumber: _phonenumber.text.toString(),
                              pincode: _pincode.text.toString(),
                              dzongkhag: _dzongkhag.text.toString(),
                              city: _city.text.toString(),
                              roadname: _roadname.text.toString()));
                         Get.to(bill(),transition: Transition.downToUp);

                        }
                      },
                      child: Text(
                        "Save Address",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
