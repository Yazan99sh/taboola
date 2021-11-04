import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/module/yes_module.dart';
import 'package:taboola/module_home/home_routes.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';

@injectable
class HomeModule extends YesModule {
  final HomeScreen _homeScreen;
  HomeModule(this._homeScreen){
   YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.HOME_SCREEN : (context)=> _homeScreen
    };
  }
}