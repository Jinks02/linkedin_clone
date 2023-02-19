import 'package:flutter/material.dart';
import 'package:linkedin_clone/services/upload_resume_service.dart';
import 'dart:developer';

class JobsScreenWidget extends StatefulWidget {
  const JobsScreenWidget({Key? key}) : super(key: key);

  @override
  State<JobsScreenWidget> createState() => _JobsScreenWidgetState();
}

class _JobsScreenWidgetState extends State<JobsScreenWidget> {

  final UploadResumeService _uploadResumeService =UploadResumeService();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
        itemBuilder: (context,index){
        return  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn2QnZ1IMQtvsRnzI73YfJQq7BIa8wCSctng&usqp=CAU'),
                  ),
                  title: const Text('Job Title',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 5,),
                      Text('Company Name',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 15),),
                      SizedBox(height: 5,),
                      Text('Location',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 13),),
                      Text('1 day ago',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 12),),

                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      _uploadResumeService.requestStoragePermissionAndUploadPdf(context);
                      log("job button pressed");
                    },
                    child: const Text('Upload Resume',style: TextStyle(fontSize: 13),),
                  ),
                ),
              ),
              const Divider(
                height: 15,
                thickness: 1,
              ),
            ],
          );
        });
  }
}
    