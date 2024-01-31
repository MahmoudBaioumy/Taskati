import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Widget/CustomBottom.dart';
import 'package:flutter_application_2/core/models/Text_style.dart';
import 'package:flutter_application_2/core/models/colorsapp.dart';
import 'package:flutter_application_2/features/home/widgets/home_header.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

class _home_viewState extends State<home_view> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //top
              Homeheader(),
              Gap(10),
              //date
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: getBodyStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Today',
                        style: getBodyStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Spacer(),
                  CustomBottom(text: '+ Add Task', onPressed: () {})
                ],
              ),
              Gap(20),
              DatePicker(
                height: 100,
                width: 80,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: colorsapp.primarycolor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  //setState(() {
                  // _selectedValue = date;
                  // });
                },
              ),
              Gap(10),
              Expanded(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: colorsapp.primarycolor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter Task -1',
                              style: getBodyStyle(color: colorsapp.whitecolor),
                            ),
                            Gap(5),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: colorsapp.whitecolor,
                                ),
                                Gap(10),
                                Text(
                                  '02:25 AM- 02:40 AM',
                                  style:
                                      getBodyStyle(color: colorsapp.greycolor),
                                ),
                              ],
                            ),
                            Gap(5),
                            Text(
                              'Flutter Task note',
                              style: getSmalStyle(color: colorsapp.whitecolor),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 0.5,
                          height: 50,
                          color: colorsapp.whitecolor,
                        ),
                        Gap(5),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Todo',
                            style: getTitelStyle(
                                color: colorsapp.whitecolor, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }


}
