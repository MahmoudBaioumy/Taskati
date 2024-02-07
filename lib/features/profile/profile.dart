import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/network/local_storage.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';
import 'package:flutter_application_2/features/home/Home_view.dart';
import 'package:flutter_application_2/features/profile/widget/Show_dialogs.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? name;
  String? path;
  late Box<bool> boxmode;
  @override
  void initState() {
    super.initState();
    path = Applocal.getData(Applocal.IMAGE_KEY);
    name = Applocal.getData(Applocal.NAME_KEY);
    boxmode = Hive.box('mode');
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = boxmode.get('darkmode') ?? false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeView(),
              ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  boxmode.put('darkmode', !isDark);
                });
              },
              icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode_rounded
                  // color: Colors.white,
                  )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///////////////image//////////////////////////////
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: path != null
                      ? FileImage(File(path!)) as ImageProvider
                      : const AssetImage('assets/avatar.webp'),
                  maxRadius: 80,
                ),
                CircleAvatar(
                  maxRadius: 20,
                  child: IconButton(
                      onPressed: () {
                        ShowImageDialog(context, onTapCamera: () {
                          uploadFromCamera();
                        }, onTapGallery: () {
                          uploadFromGallary();
                        });
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: colorsapp.primarycolor,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 50,
              indent: 50,
              thickness: 2,
              color: colorsapp.primarycolor,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    '$name',
                    style: TextStyle(
                        color: colorsapp.primarycolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: IconButton(
                        onPressed: () {
                          ShowNameDialog(context, name);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.edit,
                          color: colorsapp.primarycolor,
                        )),
                  )
                ],
              ),
            )
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
