import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/network/local_storage.dart';
import 'package:flutter_application_2/features/profile/profile.dart';

class Homeheader extends StatefulWidget {
  const Homeheader({super.key});

  @override
  State<Homeheader> createState() => _HomeheaderState();
}

class _HomeheaderState extends State<Homeheader> {
  @override
  String? name;
  String? path;

  @override
  void initState() {
    super.initState();
    path = Applocal.getData(Applocal.IMAGE_KEY);
    name = Applocal.getData(Applocal.NAME_KEY);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: const TextStyle(fontSize: 20)
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Text(
              'Have A Nice Day.',
              style: const TextStyle(fontSize: 15)
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const profile(),
            ));
          },
          child: CircleAvatar(
            maxRadius: 28,
            backgroundImage: path != null
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('assets/avatar.webp'),
          ),
        )
      ],
    );
  }
}
