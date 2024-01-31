import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/add_task.dart';
import 'package:flutter_application_2/core/Widget/CustomBottom.dart';
import 'package:flutter_application_2/core/Widget/Custom_error_dio.dart';
import 'package:flutter_application_2/core/models/Text_style.dart';
import 'package:flutter_application_2/core/models/colorsapp.dart';
import 'package:flutter_application_2/core/network/local_storage.dart';
import 'package:flutter_application_2/features/home/Home_view.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

String? path;
String? name = '';

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
            onPressed: () {
              if (path != null && name!.isNotEmpty) {
                Applocal.cashData(Applocal.IMAGE_KEY, path);
                Applocal.cashData(Applocal.NAME_KEY, name);
                Applocal.cashData(Applocal.ISUPLOAD_KEY, true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => home_view()));
              } else if (path == null && name!.isNotEmpty) {
                ShowErrorDialog(context, 'Please Upload youe Image');
              } else if (path != null && name!.isEmpty) {
                ShowErrorDialog(context, 'Enter Your Name');
              } else {
                ShowErrorDialog(
                    context, 'please Upload Your image and Enter Your Name');
              }
            },
            child: Text('Done',
                style: getTitelStyle(
                    fontSize: 17, color: colorsapp.primarycolor))),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: (path != null)
                  ? FileImage(File(path!)) as ImageProvider
                  : const AssetImage('assets/avatar.webp'),
              maxRadius: 80,
            ),
            const SizedBox(
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
            const Gap(5),
            SizedBox(
                width: 220,
                height: 45,
                child: CustomBottom(
                    text: 'Upload From Gallary',
                    onPressed: () {
                      uploadFromGallary();
                    })),
            const Gap(15),
            const Divider(
              thickness: 2,
              endIndent: 30,
              indent: 30,
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                ],
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
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
    //open camera and pick image
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromGallary() async {
    //open Gallary and take image
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
