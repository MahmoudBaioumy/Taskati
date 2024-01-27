import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Widget/CustomBottom.dart';
import 'package:flutter_application_2/core/models/Text_style.dart';
import 'package:flutter_application_2/core/models/colorsapp.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

String? path;

class camera extends StatefulWidget {
  const camera({super.key});

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {},
            child: Text('Done',
                style: getTitelStyle(
                    fontSize: 20, color: colorsapp.primarycolor))),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: (path != null)
                  ? FileImage(File(path!)) as ImageProvider
                  : AssetImage('assets/avatar.webp'),
              maxRadius: 80,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                width: 220,
                height: 45,
                child: CustomBottom(
                    text: 'Upload From Camera',
                    onPressed: () {
                      uploadFromCamera();
                    })),
            Gap(5),
            SizedBox(
                width: 220,
                height: 45,
                child: CustomBottom(
                    text: 'Upload From Gallary',
                    onPressed: () {
                      uploadFromGallary();
                    })),
            Gap(15),
            Divider(
              thickness: 2,
              endIndent: 30,
              indent: 30,
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: Text('Enter your Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: colorsapp.primarycolor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: colorsapp.primarycolor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: colorsapp.pinkcolor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: colorsapp.pinkcolor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadFromCamera() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromGallary() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
