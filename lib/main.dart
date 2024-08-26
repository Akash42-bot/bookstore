import 'package:bookstore/bindingclass/binding_class.dart';
import 'package:bookstore/model/Stateclass.dart';
import 'package:bookstore/page/Splash.dart';
import 'package:bookstore/page/bookPage1.dart';
import 'package:bookstore/page/login_page2.dart';
import 'package:bookstore/page/pay_sucess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home',
            page:()=>books(),
        binding: BindingClass()
        )
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:books(),
    );
  }
}

