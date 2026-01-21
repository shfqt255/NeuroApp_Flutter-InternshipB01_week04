import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class MediaPreview extends StatelessWidget {
  final File? image;
  final File? file;

  const MediaPreview({super.key, this.image, this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Preview"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            if (image != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selected Image",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
 SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image!,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
SizedBox(height: 20),
            if (file != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: const Icon(Icons.insert_drive_file,
                      color: Colors.blue, size: 40),
                  title: Text(
                    file!.path.split('/').last,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle:  Text("Tap to open document"),
                  trailing:  Icon(Icons.open_in_new),
                  onTap: () {
                    OpenFile.open(file!.path);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
