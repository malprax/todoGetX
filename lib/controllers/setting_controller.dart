import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  final _storage = GetStorage();
  final String _nameKey = "name";
  var username = 'username'.obs;

  static const _uriTwitter = 'https://twitter.com/ICuvula';
  static const _uriInsta = 'https://www.instagram.com/isaias_cuvula';
  static const _uriLinkedIn =
      'https://bg.linkedin.com/in/isaias-cuvula-988a8a1a9';
  static const _uriGitHub = 'https://github.com/IsaiasCuvula';

  @override
  void onInit() {
    super.onInit();
    readName();
  }

  void readName() {
    final nameValue = _storage.read(_nameKey) ?? "username";
    username.value = nameValue;
  }

  void saveName(String name) {
    _storage.write(_nameKey, name);
    readName();
  }

  void openTwitter() {
    _openUrl(_uriTwitter);
  }

  void openInstagram() {
    _openUrl(_uriInsta);
  }

  void openLinkedIn() {
    _openUrl(_uriLinkedIn);
  }

  void openGithub() {
    _openUrl(_uriGitHub);
  }

  void _openUrl(String uri) async {
    final url = Uri.parse(uri);
    try {
      await launchUrl(url);
    } catch (error) {
      print('Could not launch $url');
    }
  }
}
