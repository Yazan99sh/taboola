import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/module/yes_module.dart';
import 'package:taboola/module_customer/customers_routes.dart';
import 'package:taboola/module_customer/ui/screen/customer_details_screen.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/module_delivery/delivery_routes.dart';
import 'package:taboola/module_delivery/ui/screen/operators_screen.dart';


@injectable
class DeliveryModule extends YesModule {
  final DeliveryOperatorsScreen _deliveryScreen;
  final CustomerDetailsScreen _customerDetailsScreen;
  DeliveryModule(this._deliveryScreen,this._customerDetailsScreen){
   YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
    DeliveryRoutes.DELIVERY_SCREEN : (context)=> _deliveryScreen,
    };
  }
}