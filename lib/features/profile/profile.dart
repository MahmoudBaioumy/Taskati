import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/models/colorsapp.dart';


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: colorsapp.primarycolor,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.light_mode,
                color: colorsapp.primarycolor,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/download.jpg'),
                  maxRadius: 80,
                ),
                CircleAvatar(
                  maxRadius: 20,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: colorsapp.primarycolor,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              endIndent: 50,
              indent: 50,
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Mahmoud baioumy',
                    style: TextStyle(
                        color: colorsapp.primarycolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                        onPressed: () {},
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
}