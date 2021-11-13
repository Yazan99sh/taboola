import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/states/loading_state.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/state_manager/customers_state_manager.dart';


@injectable
class CustomersScreen extends StatefulWidget {
  final  CustomersStateManager _customersStateManager;

  CustomersScreen(this._customersStateManager);

  @override
  CustomersScreenState createState() => CustomersScreenState();
}

class CustomersScreenState extends State<CustomersScreen> {
  States? currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getCustomers() async {
    widget._customersStateManager.getCustomers(this);
  }

  @override
  void initState() {
    currentState = LoadingState(this);
   widget._customersStateManager.getCustomers(this);
    widget._customersStateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
