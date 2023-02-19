import 'package:flutter/material.dart';
import 'package:linkedin_clone/widgets/my_network_screen_widget.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyNetworkScreenWidget(),
    );
  }
}
