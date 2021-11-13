import 'package:flutter/material.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/customers_routes.dart';
import 'package:taboola/module_customer/model/customers_model.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/components/progresive_image.dart';
import 'package:taboola/utils/images/images.dart';

class CustomersLoadedState extends States {
  CustomersScreenState screenState;
  List<CustomersModel> customers;
  int _selectedItemPosition = 0;
  TextEditingController search = TextEditingController();
  CustomersLoadedState(this.screenState,
      {required this.customers})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        usersUi(context),
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
                icon:  Icon(
                  Icons.drag_handle,
                  color: Theme.of(context).disabledColor,
                ),
                onPressed: () {},
              ),
            ),
            body:  Divider(color:Theme.of(context).disabledColor,thickness: 1.0,),
          ),
        )
      ],
    );
  }
  Widget usersUi(BuildContext context){
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: BackgroundScreen(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 90.0, bottom: 10.0, left: 25.0, right: 25.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.15),
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      cursorColor: Theme.of(context).primaryColor,
                      controller: search,
                      style:  TextStyle(color: Theme.of(context).primaryColor),
                      onChanged: (value) {},
                      decoration:  InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.search_sharp,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Search hear",
                        hintStyle:
                        TextStyle(color: Theme.of(context).disabledColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  getCustomers(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget getCustomers(BuildContext context){
  List<Widget> widgets = [];
    customers.forEach((element) {
    widgets.add(GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(CustomersRoutes.CUSTOMER_DETAILS_SCREEN,arguments: element.customerId);
      },
      child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration:  BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  width: 50.0,
                  height: 50.0,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(71),
                    child: CustomNetworkImage(
                      imageSource:element.profileImage ?? '',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 125.0,
                      child: Text(
                        '${element.user.username}',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Text(
                      '${element.user.email}',
                      style: TextStyle(
                          fontSize: 12.0),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){},
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(color:Theme.of(context).disabledColor , width: 1.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.yellow,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    width: 30.0,
                    height: 30.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: const Center(
                        child:Icon(Icons.chat_bubble ,size: 20.0,)
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){},
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Theme.of(context).disabledColor , width: 1.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.red,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    width: 30.0,
                    height: 30.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: const Center(
                        child:Icon(Icons.delete ,size: 20.0,)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0 , right: 15.0 , top: 5.0 , bottom: 5.0),
          child: Divider(color: Theme.of(context).disabledColor.withOpacity(0.8),thickness: 0.5,),
        )
      ],
  ),
    ));
}
);
  return Column(children:widgets);
  }
}

