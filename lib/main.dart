import 'package:flutter/material.dart';
import 'package:linkedin_clone/providers/invite_follow_btn_text_provider.dart';
import 'package:linkedin_clone/providers/post_text_provider.dart';
import 'package:linkedin_clone/screens/bottom_navbar_handler_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostTextProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InviteFollowBtnTextProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBarHandlerScreen(),
      ),
    );
  }
}
