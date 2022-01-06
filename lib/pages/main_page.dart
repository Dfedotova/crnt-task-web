import 'package:example_project_mobile/controllers/main_page_controller.dart';
import 'package:example_project_mobile/utils/cool_stuff.dart';
import 'package:example_project_mobile/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageController c = Get.put(MainPageController());

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Можно и здесь:
    // c.load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      c.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('${answerForEverything()}'),
            Obx(() => Text(c.uri.value)),
            const CommonWidget()
          ],
        ),
      ),
    );
  }
}
