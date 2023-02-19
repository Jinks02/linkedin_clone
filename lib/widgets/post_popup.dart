import 'package:flutter/material.dart';
import 'package:linkedin_clone/providers/post_text_provider.dart';
import 'package:linkedin_clone/screens/bottom_navbar_handler_screen.dart';
import 'package:linkedin_clone/screens/home_screen.dart';
import 'package:linkedin_clone/utils/utils.dart';
import 'package:provider/provider.dart';


class PostPopup extends StatefulWidget {


  const PostPopup({super.key, });

  @override
  State<PostPopup> createState() => _PostPopupState();
}

class _PostPopupState extends State<PostPopup> {
  final TextEditingController postController = TextEditingController();

  Utils _utils =Utils();

  @override
  Widget build(BuildContext context) {
    final postTextProvider = Provider.of<PostTextProvider>(context);
    return AlertDialog(
      contentPadding: EdgeInsets.all(16),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              controller: postController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "What do you want to talk about?",
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavBarHandlerScreen(),
              ),
            );
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            postTextProvider.addPostTextToList(postController.text);
            _utils.showToastMessage("Post added");
            // debugPrint(postController.text);
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavBarHandlerScreen(),
              ),
            );
          },
          child: Text('Post'),
        ),
      ],
    );
  }
}
