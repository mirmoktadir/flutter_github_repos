import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../components/my_widgets_animator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Github Repos'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return MyWidgetsAnimator(
            apiCallStatus: controller.apiCallStatus,
            loadingWidget: () => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: () => const Center(
              child: Text('Something went worng!'),
            ),
            successWidget: () => ListView.separated(
              itemCount: controller.repos.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(controller.repos[index].description.toString());
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
            ),
          );
        },
      ),
    );
  }
}
