import 'package:flutter/material.dart';
import 'package:flutter_application_2/colorsapp.dart';

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
            child: Text(
              'Done',
              style: TextStyle(
                color: colorsapp.bluecolor,
                fontSize: 22,
              ),
            )),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/download.jpg'),
              maxRadius: 80,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorsapp.bluecolor,
                ),
                onPressed: () {},
                child: Text(
                  'Upload from Camera',
                  style: TextStyle(
                    color: colorsapp.whitecolor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorsapp.bluecolor,
                ),
                onPressed: () {},
                child: Text(
                  'Upload from Gallery',
                  style: TextStyle(
                    color: colorsapp.whitecolor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 2,
              endIndent: 30,
              indent: 30,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text('Enter your Name'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
