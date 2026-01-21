import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import 'display_media.dart';

class MediaPickerPage extends StatefulWidget {
  const MediaPickerPage({super.key});
  @override
  State<MediaPickerPage> createState() => MediaPickerPageState();
}

class MediaPickerPageState extends State<MediaPickerPage> {
  File? selectedImage;
  File? selectedFile;
  final _picker = ImagePicker();

  Future<void> ImagePickerfromGallery() async {
    final XFile? pickImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickImage != null) {
      setState(() {
        selectedImage = File(pickImage.path);
      });
    }
  }

  Future<void> ImagePickerFromCamera() async {
    final XFile? pickImage = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickImage != null) {
      setState(() {
        selectedImage = File(pickImage.path);
      });
    }
  }

  Future<void> pickDocument() async {
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles();
    if (filePicker != null) {
      setState(() {
        selectedFile = File(filePicker.files.single.path!);
      });
    }
  }

  void showDialogg() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Image'),
          content: Column(
            mainAxisSize: .min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.lightBlue),
                title: TextButton(
                  onPressed: () {
                    ImagePickerFromCamera();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.lightBlue),
                title: TextButton(
                  onPressed: () {
                    ImagePickerfromGallery();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  ),
                ),
              ),
              Align(
                alignment: .bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media Picker App'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: showDialogg,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: pickDocument,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text('Pick Document'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MediaPreview(image: selectedImage, file: selectedFile),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),

              child: Text('View Selected Media'),
            ),
          ],
        ),
      ),
    );
  }
}
