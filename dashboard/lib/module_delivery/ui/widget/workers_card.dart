import 'package:flutter/material.dart';

class WorkerCard extends StatelessWidget {
  final String name;
  final String location;
  final bool online;
  WorkerCard({required this.name,required this.location,required this.online});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).disabledColor,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: online ? Theme.of(context).primaryColor : Colors.red,
                ),
                Text(
                  online ? 'online' : 'offline',
                  style: TextStyle(
                      color: online ? Theme.of(context).primaryColor : Colors.red,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
          child: Divider(
            color: Theme.of(context).disabledColor.withOpacity(0.9),
            thickness: 0.5,
          ),
        )
      ],
    );
  }
}
