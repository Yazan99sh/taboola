import 'package:flutter/material.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/model/customer_detail_model.dart';
import 'package:taboola/module_customer/model/customers_model.dart';
import 'package:taboola/module_customer/ui/screen/customer_details_screen.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/images/images.dart';

class CustomerDetailsLoadedState extends States {
  CustomerDetailsScreenState screenState;
 CustomerDetailsModel customers;
  TextEditingController search = TextEditingController();
  CustomerDetailsLoadedState(this.screenState,
      {required this.customers})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        viewUserUi(context , size),
        SizedBox(
          height: 80.0,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Image.asset(
                  ImageAsset.LOGO,
                  height: 60,
                  width: 120,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).disabledColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body:  Divider(color: Theme.of(context).disabledColor,thickness: 1.0,),
          ),
        )
      ],
    );
  }
  Widget viewUserUi(BuildContext context , Size size){
    return  Scaffold(

      body: BackgroundScreen(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Column(
              children:  [
                 CircleAvatar(
                  maxRadius: 70,
                  minRadius: 20,
                  backgroundColor: Theme.of(context).disabledColor,
                   child: Image.network(customers.profileImage.toString()),
                ),
                const SizedBox(height: 10,),
                userCard(size,context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    const SizedBox(width: 10,),
                     Text("Latest Orders" , textScaleFactor: 1, style:  TextStyle(fontSize: 20),),
                    const Spacer(),
                    TextButton(
                      onPressed: (){

                      },
                      child:  Text("View All" , textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.grey[300])
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  width: size.width,
                  height: 160,
                  alignment: Alignment.center,
                  color: const Color(0xFF3AAD26),
                  child: Container(
                    width: 180,
                    color: Colors.transparent,
                    child: Container(
                      width: 170,
                      height: 140,
                      decoration:  BoxDecoration(
                        color:Theme.of(context).primaryColor,
                      ),
                      child: RaisedButton(
                        onPressed: (){

                        },
                        padding: const EdgeInsets.all(5),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 140,
                              alignment: Alignment.centerLeft,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Order No." , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                  Text("Address" , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                  Text("Order" , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                  Text("Bill" , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                alignment: Alignment.centerRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:   [
                                    Text("1 " , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                    Text("Address " , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                    Text("Order Name" , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                    Text("2400 " , textScaleFactor: 1, style: TextStyle(fontSize: 12 , ),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 110,
                  color: Colors.transparent,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:   [
                      Text("Current Address " , textScaleFactor: 1, style: TextStyle(fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 4.0,right: 4.0),
                        child: Text("Lorem Lorem Lorem Lorem " , textScaleFactor: 1, style: TextStyle(fontSize: 15 , color: Theme.of(context).disabledColor),),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: size.width*0.6,
                  height: 45,
                  child: RaisedButton(
                    shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    color: const Color(0xFF3AAD26),
                    child:  Text("Send Message" , textScaleFactor: 1,style: TextStyle(color: Colors.white),),
                    onPressed: (){

                    },
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: size.width*0.6,
                  height: 45,
                  child: RaisedButton(
                    shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    color:  Colors.red,
                    child:  Text("Delete" , textScaleFactor: 1,style: TextStyle(color:Colors.white),),
                    onPressed: (){

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget userCard(var size,BuildContext context){
    return Container(
      width: size.width,
      height: 110,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Column(
            children:  [
              Text("\nUser Name" , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textScaleFactor: 1,),
              SizedBox(height: 5,),
              Text(customers.user.username , style:  TextStyle(),textScaleFactor: 1,),
              Text("${customers.addresses?.phoneNo}\n" , style:  TextStyle(),textScaleFactor: 1,),
            ],
          ),
          Container(
            width: size.width * 0.09,
            height: 70,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              Text("\nPoints Rewarded\n" , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textScaleFactor: 1,),

              Text("${customers.points}\n" , style:  TextStyle(),textScaleFactor: 1,),
            ],
          ),
        ],
      ),
    );
  }
}

