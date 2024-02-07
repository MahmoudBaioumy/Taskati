import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_style.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';
import 'package:flutter_application_2/features/model/task_model.dart';
import 'package:gap/gap.dart';
import 'package:flutter_application_2/core/utils/colorsapp.dart';

class TaskCardItem extends StatelessWidget {
  const TaskCardItem({
    super.key,
    required this.task,
  });

  final Taskmodel task;

  Color getColor(index) {
    if (index == 0) {
      return colorsapp.primarycolor;
    } else if (index == 1) {
      return colorsapp.orangecolor;
    } else if (index == 2) {
      return colorsapp.pinkcolor;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: getColor(task.Color), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: getBodyStyle(color: colorsapp.whitecolor),
              ),
              const Gap(5),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color:colorsapp.whitecolor,
                  ),
                  const Gap(10),
                  Text(
                    '${task.starttime} - ${task.endtime}',
                    style: getSmalStyle(color: colorsapp.whitecolor),
                  )
                ],
              ),
              const Gap(5),
              Text(
                task.note,
                style: getBodyStyle(color: colorsapp.whitecolor),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: .5,
            height: 60,
            color: colorsapp.whitecolor,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              (task.isComplete) ? 'COMPLETED' : 'TODO',
              style: getTitelStyle(color: colorsapp.whitecolor, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}