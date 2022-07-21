import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/utils/routes.dart';
import 'package:todo/widgets/home/app_bar.dart';
import 'package:todo/widgets/home/drawer.dart';
import 'package:todo/widgets/home/task_status.dart';
import 'package:todo/widgets/home/today_task_tile.dart';
import '../controllers/setting_controller.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';
import '../widgets/home/search_tasks.dart';
import '../widgets/home/show_task_status.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final TaskController _taskController = Get.put(TaskController());
  final SettingsController _settingController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                pressToOpenDrawer: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              kVerticalSpace(40),
              Obx(() {
                final name = _settingController.username.value;
                return Text(
                  '${showGreeting()}, ${name.capitalize}',
                  style: kTextStyleBoldGrey(22.0),
                );
              }),
              Obx(
                () {
                  final tasks = _taskController.tasksList;
                  final tasksLength = _taskController.tasksLength;
                  return tasks.isEmpty
                      ? _doNotHaveTaskForMonth()
                      : Text(
                          'You have $tasksLength tasks\nthis month!',
                          style: kTextStyleBoldBlack(30),
                        );
                },
              ),
              kVerticalSpace(30),
              SearchTasks(),
              kVerticalSpace(30),
              const ShowTaskStatus(),
              kVerticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today\'s Tasks', style: kTextStyleBoldBlack(30)),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                        MyRoutes.getAllTasksPageRoute(),
                      );
                    },
                    child: Text('See All', style: kTextStyleBoldGrey(18)),
                  )
                ],
              ),
              _displayTodayTasks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayTodayTasks() {
    return GetX<TaskController>(
      builder: (controller) {
        final tasks = controller.todayTasksList;
        return SizedBox(
          height: tasks.isEmpty ? 180 : 210,
          child:
              tasks.isEmpty ? _doNotHaveTaskToday() : _hasTaskForToday(tasks),
        );
      },
    );
  }

  Widget _doNotHaveTaskToday() {
    return Container(
      width: Get.width,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You don't have task \nfor today!",
              style: kTextStyleBlack(23),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(MyRoutes.getCreateTaskRoute());
              },
              child: Text(
                "Click Here to Create One",
                style: kTextStyleBoldBlack(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hasTaskForToday(List<TaskModel> tasks) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: tasks.length,
      itemBuilder: (ctx, index) {
        final task = tasks[index];
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Get.toNamed(
              MyRoutes.getTaskDetailRoute(),
              arguments: {'task': task},
            );
          },
          child: TodayTaskTile(task: task),
        );
      },
    );
  }

  Widget _doNotHaveTaskForMonth() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You don't have tasks for",
            style: kTextStyleBoldBlack(30),
          ),
          Row(
            children: [
              Text(
                "this month yet!",
                style: kTextStyleBoldBlack(30),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.getCreateTaskRoute());
                  },
                  child: Text(
                    "Create One",
                    style: kTextStyleBoldAmber(20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
