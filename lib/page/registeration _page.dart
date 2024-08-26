
import 'package:bookstore/data/login_list2.dart';
import 'package:bookstore/model/login_model2.dart';
import 'package:bookstore/page/Imports.dart';
import 'package:bookstore/page/bookPage1.dart';
import 'package:bookstore/page/login_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();
  TextEditingController _dzongkhag=TextEditingController();
  TextEditingController _place=TextEditingController();
  TextEditingController _pincode=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _nearplace=TextEditingController();

  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/backsplash.webp'),fit:
                    BoxFit.cover,opacity: 1)),
                    child: Column(
                      children: [
                  
                        Row(
                          children: [
                            InkWell(onTap: (){
                              Navigator.pop(context);
                            },
                                child: Icon(Icons.arrow_back_ios)),
                          Text('           Registration',style: mystyle(30,Colors.black,FontWeight.bold),)
                  
                        ],),
                        Gap(40),
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _firstname,
                                  decoration: InputDecoration(
                                    label: Text('First Name'),
                                    hintText: 'First Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter first name';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _lastname,
                                  decoration: InputDecoration(
                                    label: Text('Last Name'),
                                    hintText: 'Last Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Last name';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                    controller: _email,
                                    decoration: InputDecoration(
                                        label: Text('Email'),
                                        hintText: 'Email',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter Email";
                                      }
                                      if (!value.contains('@')) ;
                                    }),
                                Gap(20),
                                TextFormField(
                                  controller: _password,
                                  obscureText: isObs,
                                  decoration: InputDecoration(
                                      label: Text("Password"),
                                      hintText: "Password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      suffix: IconButton(
                                          onPressed: () {
                                            isObs = !isObs;
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.visibility))),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Password';
                                    }
                                    if (value.length > 8) {
                                      return "Password must contain atleast 8 characters";
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _repassword,
                                  obscureText: isObs,
                                  decoration: InputDecoration(
                                      label: Text("Re-password"),
                                      hintText: "Re-password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      suffix: IconButton(
                                          onPressed: () {
                                            isObs = !isObs;
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.visibility))),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please  Re-enter your Password';
                                    }
                                    if (value != _password.text.toString()) {
                                      return 'Passwword does not match';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _dzongkhag,
                                  decoration: InputDecoration(
                                    label: Text('Dzongkhag'),
                                    hintText: 'Dzongkhag',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter first name';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _place,
                                  decoration: InputDecoration(
                                    label: Text('City'),
                                    hintText: 'city name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter colony';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _pincode,
                                  decoration: InputDecoration(
                                    label: Text('Pincode'),
                                    hintText: 'ex.1234',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter the Pincode';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _phone,
                                  decoration: InputDecoration(
                                    label: Text('Phone No.'),
                                    hintText: 'Ex.+975 1234567',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'required';
                                    }
                                  },
                                ),
                                Gap(20),
                                TextFormField(
                                  controller: _nearplace,
                                  decoration: InputDecoration(
                                    label: Text('Colony/Area/near by'),
                                    hintText: 'required',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    // suffix: Icon(Icons.drive_file_rename_outline)
                                    // prefix: Icon(Icons.account_box)
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter first name';
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
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                color: Colors.black,
                child: Text(
                  'Sign Up',
                  style: mystyle(20, Colors.white, FontWeight.bold),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final registration = SnackBar(
                      content: Text(' Signup Sucessful'),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context)
                        .showSnackBar(registration);
                    login.add(LoginModel(
                      firstname: _firstname.text.toString(),
                      secondname: _lastname.text.toString(),
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                      Dzongkhag:_dzongkhag.text.toString(),
                      Place: _place.text.toString(),
                      pincode: _pincode.text.toString(),
                      Phone: _phone.text.toString(),
                      nearplace: _nearplace.text.toString(),

                    ));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => hotel_registration()));
                  }
                },
              )
            ],
          )),
    );
  }
}
