import 'package:bookstore/data/Loginlist.dart';
import 'package:bookstore/data/droplist.dart';
import 'package:bookstore/data/login_list2.dart';
import 'package:bookstore/model/Loginmodel.dart';
import 'package:bookstore/model/Stateclass.dart';
import 'package:bookstore/model/dropdown.dart';
import 'package:bookstore/page/Imports.dart';
import 'package:bookstore/page/checkout.dart';
import 'package:bookstore/page/pay_sucess.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class bill extends StatelessWidget {
  const bill({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _) {
      return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      Text(
                        "  Payment",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            body: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 130,
                        width: 400,
                        decoration:
                            BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery to :",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                InkWell(onTap: (){
                                  Get.to(checkout());
                                },
                                  child: Container(height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                    color: Colors.orangeAccent),
                                    child: Center(child: Text('Edit',style: mystyle(15,Colors.black,FontWeight.bold),)),),
                                ),
                              ],
                            ),
                    
                            Text(
                              ms.isOn?
                               '${add[0].fullname}'',': '${login[0].firstname}'' ${login[0].secondname}'',',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  ms.isOn?
                                   '${add[0].roadname}': '${login[0].nearplace}',
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Gap(5),
                                Text(ms.isOn?
                                ',''${add[0].city}'', Bhutan':',''${login[0].Place}'', Bhutan',style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)
                                )
                              ],
                            ),
                            Text(
                              ms.isOn? 'Pincode:   ''${add[0].pincode}':'Pincode:  ''${login[0].pincode}' ,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                    
                              ],
                            ),
                            Row(
                              children: [

                              ],
                            ),
                            Text(
                              ms.isOn?'${add[0].phonenumber}':'${login[0].Phone}',style: mystyle(15,Colors.black,FontWeight.bold),

                            )
                          ],
                        ),
                      ),
                      Divider(),

                      SizedBox(
                        height: 4,
                      ),
                      Gap(5),
                      Text(
                        "Payment Method",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                            SizedBox(
                              child: DropdownButton<PayModel>(
                                hint: Text("Select Payment Method"),
                                value: ms.selectedPayment,
                                onChanged: (PayModel? newValue) {
                                  ms.selectPayment(newValue);
                                },
                                items: payment.map((PayModel payment) {
                                  return DropdownMenuItem<PayModel>(
                                    value: payment,
                                    child: Row(
                    children: [
                      Text(payment.icon),
                      SizedBox(width: 8),
                      Text(payment.bob),
                    ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                      Gap(20),
                      TextFormField(decoration: 
                        InputDecoration(
                            hintText: 'Card No',
                            border: OutlineInputBorder(borderRadius:
                        BorderRadius.circular(10))),),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(height: 50,width: 200,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: 
                        BorderRadius.circular(10)),
                        child: Column(children: [
                          TextFormField(
                            decoration:InputDecoration(
                              hintText: '           Exp Date'
                            ),
                          )
                        ],),
                        ),
                        Container(height: 50,width: 100,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '       CVV'
                            ),
                          )
                        ],),
                        ),

                      ],)
                    ],
                                    ),
                                  ),
                  )),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border:
                    Border.all(color: Colors.black)),
                    height: 105,
                    child: Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color:Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sub total .' '\$' '${ms.calculate()}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      'Shipping .' '\$' '20',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Total: ' '\$' '${ms.amount()}',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 200,
                                color: Colors.white,
                                  child: Center(
                                      child: InkWell(
                                        onTap: (){
                                         showModalBottomSheet(

                                             context: context,
                                             builder:(BuildContext context){
                                           return Container(
                                             height: 300,width: double.infinity,
                                             child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                               Text("Make the Payment?",style: mystyle(30),),
                                                 Gap(40),
                                                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                     children: [
                                                       MaterialButton(onPressed: (){
                                                         Get.to(anim(),transition:
                                                         Transition.rightToLeft);
                                                       }
                                                       ,child: Text('Yes',style: mystyle(20),),
                                                       ) ,MaterialButton(onPressed: (){
                                                         Get.back();
                                                       }
                                                       ,child: Text('No',style: mystyle(20),),
                                                       )

                                                     ],)
                                             ],),

                                           );
                                             }
                                             );
                                      },
                                        child: Container(
                                          margin: EdgeInsets.only(right:  10),
                                          decoration: BoxDecoration(color: Colors.orangeAccent,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                            height: 70,
                                            width: 200,
                                            child: Center(child: Text('BUY NOW'
                                            ,style: mystyle(20,Colors.black,FontWeight.bold),
                                            ))),
                                      )),

                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ])),
      );
    });
  }
}
