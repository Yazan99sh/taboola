import 'package:flutter/material.dart';
import 'package:taboola/utils/components/progresive_image.dart';


class HomeCard extends StatelessWidget {
  final String title;
  final String image;
  final GestureTapCallback? onTap;
  const HomeCard({Key? key, required this.title, required this.image,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 125,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap:onTap,
            child: Stack(
              children: [
                 CustomNetworkImage(
                  width: 200,
                  height: 200,
                  imageSource: image,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 35,
                    width: 1000,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.00),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.3),
                          ]),
                    ),
                    child: Center(
                        child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
