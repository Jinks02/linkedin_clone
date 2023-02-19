import 'package:flutter/material.dart';
import 'package:linkedin_clone/screens/jobs_screen.dart';
import 'package:linkedin_clone/screens/network_screen.dart';
import 'package:linkedin_clone/screens/notification_screen.dart';
import 'package:linkedin_clone/screens/post_screen.dart';


import 'home_screen.dart';

class BottomNavBarHandlerScreen extends StatefulWidget {
  const BottomNavBarHandlerScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarHandlerScreen> createState() => _BottomNavBarHandlerScreenState();
}

class _BottomNavBarHandlerScreenState extends State<BottomNavBarHandlerScreen> {


  int _selectedIndex = 0;
  void _changeBottomNavBar(int index) {
    // bottom bar navigation
    setState(() {
      _selectedIndex = index;
    });
  }


  final List<Widget> _bottomBarTabScreensList = [
    HomeScreen(),
    NetworkScreen(),
    PostScreen(),
    NotificationScreen(),
    JobsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomBarTabScreensList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // specify this when there are more than 3 or 4 items
        onTap: _changeBottomNavBar,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'My Network'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box), label: 'Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), label: 'Jobs'),
        ],
      ),
    );
  }
}
