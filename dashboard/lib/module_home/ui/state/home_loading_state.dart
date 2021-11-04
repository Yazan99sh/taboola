import 'package:flutter/material.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';
import 'package:taboola/module_home/ui/state/home_state.dart';

class HomeLoadingState extends HomeState {
  HomeLoadingState(HomeScreenState screenState) : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
