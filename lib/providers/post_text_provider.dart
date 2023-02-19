import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostTextProvider with ChangeNotifier{

  List<String> _postTextList =[];

  List<String> get getPostTextList => _postTextList;

  void addPostTextToList (String postText){

    _postTextList.add(postText);
    notifyListeners();

  }
}