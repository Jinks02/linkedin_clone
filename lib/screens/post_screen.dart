import 'package:flutter/material.dart';
import 'package:linkedin_clone/widgets/post_popup.dart';

import 'bottom_navbar_handler_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PostPopup()
    );
  }
}
