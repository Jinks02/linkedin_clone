import 'package:flutter/material.dart';
import 'package:linkedin_clone/providers/post_text_provider.dart';
import 'package:linkedin_clone/widgets/post_bottom_icons.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key, t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postTextProvider = Provider.of<PostTextProvider>(context);

    return ListView.builder(
        itemCount: postTextProvider.getPostTextList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/25/3a/bf/253abf4f1f4bc16b6dc04571f8d21624.png'),
                ),
                title: Text(
                  "John Doe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "Position \n2h",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Consumer<PostTextProvider>(
                    builder: (context, value, child) {
                  return Text(
                    value.getPostTextList[index].toString(),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.thumb_up,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          "546",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "78 comments",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "42 reposts",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PostBottomIcons(
                      icon: Icons.thumb_up_outlined, iconText: "Like"),
                  PostBottomIcons(
                      icon: Icons.comment_outlined, iconText: "Comment"),
                  PostBottomIcons(icon: Icons.loop, iconText: "Repost"),
                  PostBottomIcons(icon: Icons.send, iconText: "Send"),
                ],
              ),
              Divider(
                color: Colors.blueGrey,
                thickness: 5,
              ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          );
        });
  }
}
