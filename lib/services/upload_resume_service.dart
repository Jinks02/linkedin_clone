import 'package:flutter/material.dart';
import 'package:linkedin_clone/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';

class UploadResumeService {
  // Future<String> uploadPdf(File file, String fileName) async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   Reference reference = storage.ref().child('pdfs/$fileName.pdf');
  //   UploadTask uploadTask = reference.putFile(file);
  //   TaskSnapshot taskSnapshot = await uploadTask;
  //   String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  // Future<void> uploadPdf () async{
  //   final Directory appDirectory = await getApplicationDocumentsDirectory();
  //   final String filePath = '${appDirectory.path}/my_pdf_file.pdf';
  //   Reference storageReference = FirebaseStorage.instance.ref().child('pdfs/my_pdf_file.pdf');
  //   log(filePath);
  //   UploadTask uploadTask = storageReference.putFile(File(filePath));
  //   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
  //
  // }

  Utils _utils = Utils();

  Future<File?> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      return File(result.files.single.path!);
    } else {
      // User canceled the picker
      return null;
    }
  }

  Future<String> uploadPDF(File file) async {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('pdfs/${file.path.split('/').last}');
    final task = ref.putFile(file);
    await task.whenComplete(
      () => _utils.showToastMessage("Upload complete"),
    );
    final url = await ref.getDownloadURL();
    return url;
  }



  Future<void> requestStoragePermissionAndUploadPdf(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted, access device storage here
      File? pickedPdf = await pickPDF();
      String pdfUrl = await uploadPDF(pickedPdf!);
      log(pdfUrl.toString());
    } else {
      // Permission denied, handle the situation here
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Storage Permission Required'),
            content: Text(
                'This app needs access to your device storage to function properly.'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Open Settings'),
                onPressed: () => openAppSettings(),
              ),
            ],
          );
        },
      );
    }
  }
}
