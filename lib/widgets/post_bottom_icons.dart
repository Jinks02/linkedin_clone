import 'package:flutter/material.dart';

class PostBottomIcons extends StatelessWidget {
  final IconData icon;
  final String iconText;

  PostBottomIcons({required this.icon, required this.iconText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon,size: 20,),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            iconText,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
