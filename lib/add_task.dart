import 'package:flutter/material.dart';
import 'package:flutter_application_2/colorsapp.dart';

class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ),
        title: Text(
          'Add Task',
          style: TextStyle(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text(
                  'Enter titel here',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.whitecolor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorsapp.redcolor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorsapp.redcolor,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 10,
              endIndent: 10,
              thickness: 3,
              color: Colors.black38,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Note',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text(
                  'Enter note here',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.whitecolor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorsapp.redcolor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorsapp.redcolor,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 10,
              endIndent: 10,
              thickness: 3,
              color: Colors.black38,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Date',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {}, icon: Icon(Icons.date_range_outlined)),
                label: Text(
                  '10/30/2023',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.greycolor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: colorsapp.whitecolor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorsapp.redcolor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: colorsapp.redcolor,
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 10,
              endIndent: 10,
              thickness: 3,
              color: Colors.black38,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 100,
                        width: 160,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: Text(
                              '02:30 AM',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            suffixIcon: Icon(Icons.watch_later_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: colorsapp.greycolor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: colorsapp.greycolor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: colorsapp.redcolor),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: colorsapp.redcolor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 100,
                        width: 170,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: Text(
                              '02:45 AM',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            suffixIcon: Icon(Icons.watch_later_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: colorsapp.greycolor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: colorsapp.greycolor),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: colorsapp.redcolor),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: colorsapp.redcolor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[900],
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            backgroundColor: colorsapp.pinkcolor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CircleAvatar(
                            backgroundColor: colorsapp.orangecolor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(shape: BoxShape.rectangle),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[400]),
                      onPressed: () {},
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            color: colorsapp.whitecolor, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
