import 'package:flutter/material.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/utils/components/costom_search.dart';
import 'package:taboola/utils/images/images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: 250,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 75),
            child: Center(
              child: Image.asset(
                ImageAsset.LOGO,
                width: 225,
                height: 225,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16, left: 25, right: 25),
              child:CustomDeliverySearch(
                hintText: S.of(context).searchFor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
