import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/setting_controller.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class IconTextRow extends StatelessWidget {
  IconTextRow({Key? key, required this.label, required this.icon})
      : super(key: key);

  final String label;
  final IconData icon;
  final SettingsController _settingController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (label == 'LinkedIn') _settingController.openLinkedIn();
        if (label == 'Twitter') _settingController.openTwitter();
        if (label == 'Github') _settingController.openGithub();
        if (label == 'Instagram') _settingController.openInstagram();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(icon, size: 24),
          const SizedBox(width: 10),
          Text(label, style: kTextStyleBlack(20)),
        ],
      ),
    );
  }
}
