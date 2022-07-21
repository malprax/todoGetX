import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/widgets/home/task_status.dart';
import '../../utils/routes.dart';

class ShowTaskStatus extends StatelessWidget {
  const ShowTaskStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TaskStatusContainer(
          label: 'To-Do',
          iconData: Icons.assignment_rounded,
          color: Colors.pink,
          onTap: () {
            _goToTasksByStatus('To-Do');
          },
        ),
        TaskStatusContainer(
            label: 'Progress',
            iconData: Icons.assignment_late_rounded,
            color: Colors.amber,
            onTap: () {
              _goToTasksByStatus('In Progress');
            }),
        TaskStatusContainer(
            label: 'Done',
            iconData: Icons.assignment_turned_in,
            color: Colors.green,
            onTap: () {
              _goToTasksByStatus('Done');
            }),
      ],
    );
  }

  _goToTasksByStatus(String status) {
    Get.toNamed(
      MyRoutes.getTasksByStatusRoute(),
      arguments: {'status': status},
    );
  }
}
