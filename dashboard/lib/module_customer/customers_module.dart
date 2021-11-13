import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/module/yes_module.dart';
import 'package:taboola/module_customer/customers_routes.dart';
import 'package:taboola/module_customer/ui/screen/customer_details_screen.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';


@injectable
class CustomersModule extends YesModule {
  final CustomersScreen _customersScreen;
  final CustomerDetailsScreen _customerDetailsScreen;
  CustomersModule(this._customersScreen,this._customerDetailsScreen){
   YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CustomersRoutes.CUSTOMERS_SCREEN : (context)=> _customersScreen,
      CustomersRoutes.CUSTOMER_DETAILS_SCREEN : (context)=> _customerDetailsScreen,

    };
  }
}