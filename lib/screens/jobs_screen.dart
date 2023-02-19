import 'package:flutter/material.dart';
import 'package:linkedin_clone/widgets/jobs_screen_widget.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: JobsScreenWidget(),
    );
  }
}
