import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:injectable/injectable.dart';
import 'package:share/share.dart';
import 'package:taboola/di/di_config.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/module_delivery/ui/screen/operators_screen.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';


@injectable
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  PageController homeController = PageController(initialPage: 0);
  bool flagPageIndex = true;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args is int && flagPageIndex) {
      selectedPage = args;
      homeController = PageController(initialPage: args);
      flagPageIndex = false;
    }
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child:PageView(
          physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          controller: homeController,
          onPageChanged: (index) {
            selectedPage = index;
            setState(() {});
            homeController.animateToPage(index,
                duration: Duration(milliseconds: 15), curve: Curves.linear);
          },
          children: [
            getIt<HomeScreen>(),
            Container(),
            getIt<CustomersScreen>(),
            Container(),
            getIt<DeliveryOperatorsScreen>(),
            // getIt<MyNotificationsScreen>(),
            // getIt<AccountScreen>()
          ],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.circle,
        padding: EdgeInsets.zero,
        backgroundColor: Theme.of(context).primaryColor,
        snakeViewColor: Colors.yellow,
        selectedItemColor: null,
        unselectedItemColor: Theme.of(context).scaffoldBackgroundColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedPage,
        onTap: (index) => setState(() {
          selectedPage = index;
          homeController.animateToPage(index,
              duration: Duration(milliseconds: 15), curve: Curves.linear);

          // if(index==1){
          //   //Navigator.of(context).pushNamed(Routes.favorite).then((value) => setState((){}));
          // }else if(index==2){
          //
          //   //   Navigator.of(context).pushNamed(Routes.allCart);
          // }else{}
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive_sharp,
              ),
              label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add), label: 'Delivery'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
