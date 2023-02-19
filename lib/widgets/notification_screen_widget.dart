import 'package:flutter/material.dart';

class NotificationScreenWidget extends StatelessWidget {
  const NotificationScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pinimg.com/originals/25/3a/bf/253abf4f1f4bc16b6dc04571f8d21624.png"),
          ),
          title: Text("Notification Content"),
          trailing: Column(
            children: [
              Text("1h"),
              Icon(Icons.more_vert),
            ],
          ) ,
        ),
        SizedBox(height: 20,)
      ],
    );

  }
}
