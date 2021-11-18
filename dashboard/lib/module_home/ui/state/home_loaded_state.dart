import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:taboola/module_home/model/categories_model.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';
import 'package:taboola/module_home/ui/state/home_state.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/components/progresive_image.dart';
import 'package:taboola/utils/images/images.dart';


class HomeLoadedState extends HomeState {
  HomeScreenState screenState;
  List<CategoriesModel> categories;
  int _selectedItemPosition = 0;
  TextEditingController search = TextEditingController();
  HomeLoadedState(this.screenState,
      {required this.categories})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        homeUi(context),
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
                  color:Theme.of(context).disabledColor,
                ),
                onPressed: () {},
              ),
            ),
            body:  Divider(color: Theme.of(context).disabledColor,thickness: 1.0,),
          ),
        )
      ],
    );
  }

  Widget homeUi(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },

      ),
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 110 , left: 35 , right: 35),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).disabledColor.withOpacity(0.15),
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
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
                      hintText: "Search food",
                      hintStyle: TextStyle(color: Theme.of(context).disabledColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                getCategories(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getCategories(BuildContext context) {
    print(categories.length);
    List<Widget> widgets = [];
    categories.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).disabledColor.withOpacity(0.25),
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CustomNetworkImage(
                  imageSource: element.categoryImage,
                  width: 120.0,
                  height: 90.0,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    width: 100.0,
                    child: Text(element.categoryName , style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , overflow: TextOverflow.clip ,),textAlign: TextAlign.center,)),
                const Text("" , style: TextStyle(fontSize: 14.0 , ),),
              ],

            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){},
              child: Container(
                decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red , width: 1.0),

                ),
                width: 30.0,
                height: 30.0,
                margin: const EdgeInsets.only(right: 10.0),
                child: const Center(
                    child:Icon(Icons.delete ,size: 20.0,color: Colors.red,)
                ),
              ),
            ),
          ],
        ),
      ));
    });
  return Flex(direction: Axis.vertical,children: widgets,);
  }
}
