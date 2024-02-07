import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Widget/CustomBottom.dart';
import 'package:flutter_application_2/core/utils/Text_style.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';
import 'package:flutter_application_2/features/add_task/add_task_view.dart';
import 'package:flutter_application_2/features/home/widgets/home_header.dart';
import 'package:flutter_application_2/features/home/widgets/taskitem.dart';
import 'package:flutter_application_2/features/model/task_model.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());

  late Box<bool> boxmode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxmode = Hive.box('mode');
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = boxmode.get('darkmode') ?? false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              const Homeheader(),
              // today
              const Gap(20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: Theme.of(context).textTheme.displayMedium!,
                      ),
                      Text(
                        'Today',
                        style: Theme.of(context).textTheme.displayMedium!,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: CustomBottom(
                      text: '+ Add Task',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const add_task(),
                        ));
                      },
                    ),
                  )
                ],
              ),
              const Gap(20),
              DatePicker(
                DateTime(2024, 1, 1),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: colorsapp.primarycolor,
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle()
                    .copyWith(color: Theme.of(context).primaryColor),
                monthTextStyle: const TextStyle()
                    .copyWith(color: Theme.of(context).primaryColor),
                dayTextStyle: const TextStyle()
                    .copyWith(color: Theme.of(context).primaryColor),
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    selectedDate = DateFormat.yMd().format(date);
                  });
                },
              ),

              // Tasks List

              Expanded(
                  child: ValueListenableBuilder<Box<Taskmodel>>(
                valueListenable: Hive.box<Taskmodel>('task').listenable(),
                builder: (context, Box<Taskmodel> box, child) {
                  List<Taskmodel> tasks = [];
                  for (var element in box.values) {
                    if (selectedDate == element.date) {
                      tasks.add(element);
                    }
                  }
                  return tasks.isEmpty
                      ? Center(
                          child: Text(
                          'No task yet',
                          style: getBodyStyle(
                              color: Theme.of(context).primaryColor),
                        ))
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            Taskmodel task = tasks[index];
                            return Dismissible(
                                key: UniqueKey(),
                                // delete continear
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(10),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.delete),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                                // complete continear
                                background: Container(
                                  color: Colors.green,
                                  padding: const EdgeInsets.all(10),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.check),
                                      Text('Complete'),
                                    ],
                                  ),
                                ),
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    // complete
                                    box.put(
                                        task.id,
                                        Taskmodel(
                                            id: task.id,
                                            title: task.title,
                                            note: task.note,
                                            date: task.date,
                                            starttime: task.starttime,
                                            endtime: task.endtime,
                                            Color: 3,
                                            isComplete: true));
                                  } else {
                                    // delete
                                    box.delete(task.id);
                                  }
                                },
                                child: TaskCardItem(task: task));
                          },
                        );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
