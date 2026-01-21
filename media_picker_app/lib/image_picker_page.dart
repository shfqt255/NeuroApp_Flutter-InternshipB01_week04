import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});
  @override
  State<ImagePickerPage> createState() => ImagePickerPageState();
}

class ImagePickerPageState extends State<ImagePickerPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media Picker App'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: ImagePickerfromGallery,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text('Pick Image from Gallery'),
            ),
            ElevatedButton(
              onPressed: ImagePickerFromCamera,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Text('Pick Image from Camera'),
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
          ],
        ),
      ),
    );
  }
}
