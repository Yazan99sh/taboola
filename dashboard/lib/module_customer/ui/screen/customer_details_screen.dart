import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/states/loading_state.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/state_manager/customer_details_state_manager.dart';


@injectable
class CustomerDetailsScreen extends StatefulWidget {
  final  CustomerDetailsStateManager _customersStateManager;

  CustomerDetailsScreen(this._customersStateManager);

  @override
  CustomerDetailsScreenState createState() => CustomerDetailsScreenState();
}

class CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  States? currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }



  @override
  void initState() {
    currentState = LoadingState(this);
    widget._customersStateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }
  bool flag = true;
  String customerId = '';
  @override
  Widget build(BuildContext context) {
    if (flag){
      String? args = ModalRoute.of(context)?.settings.arguments.toString();
      customerId = args.toString();
      widget._customersStateManager.getCustomerDetails(this,args.toString());
      flag = false;
    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState?.getUI(context),
      ),
    );
  }
}
