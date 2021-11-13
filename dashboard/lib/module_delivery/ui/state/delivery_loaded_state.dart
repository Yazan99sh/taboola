import 'package:flutter/material.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_delivery/model/delivery_operetors_model.dart';
import 'package:taboola/module_delivery/ui/screen/operators_screen.dart';
import 'package:taboola/module_delivery/ui/widget/workers_card.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/images/images.dart';

class DeliveryOperatorsLoadedState extends States {
  DeliveryOperatorsScreenState screenState;
  List<DeliveryOperatorsModel> operators;
  TextEditingController search = TextEditingController();
  DeliveryOperatorsLoadedState(this.screenState,
      {required this.operators})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        deliveryUi(context),
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

  Widget deliveryUi(BuildContext context){
    return Scaffold(
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.only(top: 100.0 , bottom: 10.0 , left: 25.0 , right: 25.0),
            child: Column(
              children:  workers(),
            ),
          ),
        ),
      ),

    );
  }

  List<Widget> workers(){
    List<Widget> widgets = [];
    operators.forEach((element) {
      WorkerCard(
        name: element.user.username,
        location: element.country,
        online: element.online,
      );
    });

    return widgets;

  }

}

