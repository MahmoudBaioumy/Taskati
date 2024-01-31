import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/models/Text_style.dart';
import 'package:flutter_application_2/core/network/local_storage.dart';

class Homeheader extends StatefulWidget {
  const Homeheader({super.key});

  @override
  State<Homeheader> createState() => _HomeheaderState();
}

class _HomeheaderState extends State<Homeheader> {
  @override
  String? name;
  String?path;

  void initState() {
    super.initState();
    path = Applocal.getData(Applocal.IMAGE_KEY);
    name = Applocal.getData(Applocal.NAME_KEY);
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: getTitelStyle(),
            ),
            Text(
              'Have A Nice Day.',
              style: getBodyStyle(),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundImage: path!=null

           ?FileImage(File(path!))as ImageProvider
           : AssetImage('assets/avatar.webp'),
        )
      ],
    );
  }
}
