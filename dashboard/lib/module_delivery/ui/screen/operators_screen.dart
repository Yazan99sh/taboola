import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/states/loading_state.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/state_manager/customers_state_manager.dart';
import 'package:taboola/module_delivery/state_manager/delivery_operators_state_manager.dart';


@injectable
class DeliveryOperatorsScreen extends StatefulWidget {
  final  DeliveryOperatorsStateManager _customersStateManager;

  DeliveryOperatorsScreen(this._customersStateManager);

  @override
  DeliveryOperatorsScreenState createState() => DeliveryOperatorsScreenState();
}

class DeliveryOperatorsScreenState extends State<DeliveryOperatorsScreen> {
  States? currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getCustomers() async {
    widget._customersStateManager.getOperators(this);
  }

  @override
  void initState() {
    currentState = LoadingState(this);
   widget._customersStateManager.getOperators(this);
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
