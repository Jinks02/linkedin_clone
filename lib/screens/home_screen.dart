import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/post_screen.dart';
import 'package:linkedin_clone/widgets/home_screen_widget.dart';

import '../widgets/post_bottom_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: HomeScreenWidget()
      );

  }
}
