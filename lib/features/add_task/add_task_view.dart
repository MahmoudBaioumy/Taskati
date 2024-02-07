import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Widget/CustomBottom.dart';
import 'package:flutter_application_2/core/utils/Text_style.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';
import 'package:flutter_application_2/features/home/Home_view.dart';
import 'package:flutter_application_2/features/model/task_model.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class add_task extends StatefulWidget {
  const add_task({super.key});

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> {
  int Colorindex = 0;

  var textcon = TextEditingController();
  var notecon = TextEditingController();
  String data = DateFormat.yMd().format(DateTime.now());
  String StartTime = DateFormat('hh:mm a').format(DateTime.now());
  String EndTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  late Box<Taskmodel> taskBox;

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box('task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          'Add Task',
          style: getTitelStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: getTitelStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
              const Gap(5),
              TextFormField(
                style: getBodyStyle(color: Theme.of(context).primaryColor),
                controller: textcon,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Enter title here',
                ),
              ),
              const Divider(
                height: 1,
                indent: 10,
                endIndent: 10,
                thickness: 3,
                color: Colors.black38,
              ),
              const Gap(10),
              Text(
                'Note',
                style: getTitelStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
              const Gap(5),
              TextFormField(
                style: getBodyStyle(color: Theme.of(context).primaryColor),
                controller: notecon,
                maxLines: 4,
                decoration: const InputDecoration(
                    hintText: 'Enter note here ...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),
              const Divider(
                height: 1,
                indent: 10,
                endIndent: 10,
                thickness: 3,
                color: Colors.black38,
              ),
              const Gap(10),
              Text(
                'Date',
                style: getTitelStyle(
                    fontSize: 25, color: Theme.of(context).primaryColor),
              ),
              const Gap(5),
              TextFormField(
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                    hintStyle:
                        getBodyStyle(color: Theme.of(context).primaryColor),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: data,
                    suffixIcon: IconButton(
                        onPressed: () {
                          ShowDateDialog();
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: colorsapp.primarycolor,
                        ))),
              ),
              const Divider(
                height: 1,
                indent: 10,
                endIndent: 10,
                thickness: 3,
                color: Colors.black38,
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Start Time',
                      style: getBodyStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  const Gap(15),
                  Expanded(
                    child: Text(
                      'End Time',
                      style: getBodyStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintStyle:
                          getBodyStyle(color: Theme.of(context).primaryColor),
                      suffixIcon: IconButton(
                          onPressed: () {
                            ShowStartDate(
                              
                            );
                          },
                          icon: Icon(
                            Icons.watch_later_outlined,
                            color: colorsapp.primarycolor,
                          )),
                      hintText: StartTime,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
                  const Gap(15),
                  Expanded(
                      child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintStyle:
                          getBodyStyle(color: Theme.of(context).primaryColor),
                      suffixIcon: IconButton(
                          onPressed: () {
                            ShowEndDate();
                          },
                          icon: Icon(
                            Icons.watch_later_outlined,
                            color: colorsapp.primarycolor,
                          )),
                      hintText: EndTime,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  //Colors
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Color',
                                style: const TextStyle().copyWith(
                                    color: Theme.of(context).primaryColor),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Colorindex = 0;
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: colorsapp.primarycolor,
                                      child: (Colorindex == 0)
                                          ? Icon(
                                              Icons.check,
                                              color: colorsapp.whitecolor,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  const Gap(5),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Colorindex = 1;
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: colorsapp.pinkcolor,
                                      child: (Colorindex == 1)
                                          ? Icon(
                                              Icons.check,
                                              color: colorsapp.whitecolor,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  const Gap(5),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Colorindex = 2;
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: colorsapp.orangecolor,
                                      child: (Colorindex == 2)
                                          ? Icon(
                                              Icons.check,
                                              color: colorsapp.whitecolor,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 45,
                      width: 140,
                      child: CustomBottom(
                        text: 'Create Task',
                        onPressed: () {
                          String id =
                              '${textcon.text}${DateTime.now().millisecond}';
                          taskBox.put(
                              id,
                              Taskmodel(
                                  id: id,
                                  title: textcon.text,
                                  note: notecon.text,
                                  date: data,
                                  starttime: StartTime,
                                  endtime: EndTime,
                                  Color: Colorindex,
                                  isComplete: false));
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomeView()));
                        },
                      ),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ShowDateDialog() async {
    var pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));

    if (pickDate != null) {
      setState(() {
        data = DateFormat.yMd().format(pickDate);
      });
    }
  }

  ShowStartDate() async {
    var pickStartTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
      

    if (pickStartTime != null) {
      setState(() {
        StartTime = pickStartTime.format(context);
      });
    }
  }

  ShowEndDate() async {
    var pickStartTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickStartTime != null) {
      setState(() {
        EndTime = pickStartTime.format(context);
      });
    }
  }
}
