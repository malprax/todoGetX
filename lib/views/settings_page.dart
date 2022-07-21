import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/widgets/settings/settings_header.dart';
import '../utils/constants.dart';
import '../widgets/settings/display_name.dart';
import '../widgets/settings/icon_text_row.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsHeader(),
              kVerticalSpace(20),
              IconTextRow(icon: Icons.person, label: 'Username'),
              DisplayName(),
              Divider(thickness: 2, color: Colors.amber.withOpacity(0.3)),
              Text('Get in Touch With Dev', style: kTextStyleBlack(20)),
              Divider(thickness: 2, color: Colors.amber.withOpacity(0.3)),
              IconTextRow(icon: FontAwesomeIcons.twitter, label: 'Twitter'),
              IconTextRow(icon: FontAwesomeIcons.github, label: 'Github'),
              IconTextRow(
                icon: FontAwesomeIcons.instagram,
                label: 'Instagram',
              ),
              IconTextRow(icon: FontAwesomeIcons.linkedin, label: 'LinkedIn'),
            ],
          ),
        ),
      ),
    );
  }
}
