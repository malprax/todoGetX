import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/widgets/all_tasks/task_tile.dart';
import '../../controllers/task_controller.dart';
import '../../utils/routes.dart';

class DisplayTasks extends StatelessWidget {
  DisplayTasks({Key? key}) : super(key: key);
  final TaskController _taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final tasks = _taskController.tasksList;
        final filteredDate = _taskController.filteredDate.value;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (ctx, index) {
            final task = tasks[index];
            final selectedDate = DateFormat.yMd().format(filteredDate);
            if (task.date == selectedDate) {
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Get.toNamed(
                    MyRoutes.getTaskDetailRoute(),
                    arguments: {'task': task},
                  );
                },
                child: TaskTile(task: task),
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
