import 'package:flutter/material.dart';
import 'package:linkedin_clone/providers/invite_follow_btn_text_provider.dart';
import 'package:provider/provider.dart';

import '../services/invite_follow_user_github.dart';

class MyNetworkScreenWidget extends StatefulWidget {
  const MyNetworkScreenWidget({Key? key}) : super(key: key);

  @override
  State<MyNetworkScreenWidget> createState() => _MyNetworkScreenWidgetState();
}

class _MyNetworkScreenWidgetState extends State<MyNetworkScreenWidget> {

  InviteFollowUserGithub _inviteFollowUserGithub = InviteFollowUserGithub();
  TextEditingController followUserNameController = TextEditingController();
  TextEditingController repoNameToInvite = TextEditingController();
  TextEditingController userNameToInvite = TextEditingController();


  // Widget followPopup (){
  //
  // }
  //
  //
  // Widget invitePopup(){
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    final btnTextProvider = Provider.of<InviteFollowBtnTextProvider>(context);
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height/ 7,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/25/3a/bf/253abf4f1f4bc16b6dc04571f8d21624.png'),
                        ),
                      ),
                      Column(
                        children: const [
                          Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                          SizedBox(height: 10,),
                          Text("Description",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 17),),
                          SizedBox(height: 10,),
                          Text("Followers",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 15),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              contentPadding: EdgeInsets.all(16),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      maxLines: 4,
                                      controller: followUserNameController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        hintText: "Enter github user name you want to follow",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => BottomNavBarHandlerScreen(),
                                    //   ),
                                    // );
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _inviteFollowUserGithub.followGithubUser(followUserNameController.text);
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => BottomNavBarHandlerScreen(),
                                    //   ),
                                    // );
                                  },
                                  child: Text('Follow'),
                                ),
                              ],
                            );
                          });
                          btnTextProvider.updateFollowText();
                        },
                        style: TextButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Consumer<InviteFollowBtnTextProvider>(
                            builder: (context,value,child){
                              return Text(value.getFollowText);
                            }),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(context: context, builder: (BuildContext context){
                           return AlertDialog(
                              contentPadding: EdgeInsets.all(16),
                              content: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        TextField(
                                          maxLines: 4,
                                          controller: repoNameToInvite ,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            hintText: "Enter github repo name you want to invite to",
                                          ),
                                        ),
                                        TextField(
                                          maxLines: 4,
                                          controller: userNameToInvite ,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            hintText: "Enter github user name you want to invite",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => BottomNavBarHandlerScreen(),
                                    //   ),
                                    // );
                                  },
                                  child: Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _inviteFollowUserGithub.sendInviteRequest(repoNameToInvite.text, userNameToInvite.text);
                                    Navigator.pop(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => BottomNavBarHandlerScreen(),
                                    //   ),
                                    // );
                                  },
                                  child: Text('Invite'),
                                ),
                              ],
                            );
                          });
                          btnTextProvider.updateInviteText();
                        },
                        style: TextButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Consumer<InviteFollowBtnTextProvider>(
                            builder: (context,value,child){
                              return Text(value.getInviteText);
                            },),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                height: 3,
                thickness: 3,
              ),
            ],
          ),
        );
      },
    );
  }
}
