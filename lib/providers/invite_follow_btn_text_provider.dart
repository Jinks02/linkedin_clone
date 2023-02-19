import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InviteFollowBtnTextProvider with ChangeNotifier {
  String _followText = "Follow";

  String get getFollowText => _followText;

  void updateFollowText(){
    _followText = "Following";
    notifyListeners();
  }


  String _inviteText = "Invite";

  String get getInviteText => _inviteText;

  void updateInviteText(){
    _inviteText = "Invited";
    notifyListeners();
  }


  // List<String> _followTextChangeIndexList = [];
  // List<String> get getFollowTextChangeIndexList => _followTextChangeIndexList;
  // void updateFollowTextOnThatIndex(int index){
  //   _followTextChangeIndexList.insert(index, "Following");
  //   notifyListeners();
  // }

}