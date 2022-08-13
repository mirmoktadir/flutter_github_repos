import 'package:flutter/material.dart';
import 'package:flutter_github_repos/app/modules/home/views/repo_detail_view.dart';
import 'package:flutter_github_repos/config/theme/my_fonts.dart';

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
              child: Text('Something went wrong!'),
            ),
            successWidget: () => ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(25),
              itemCount: controller.repoList.length,
              itemBuilder: (BuildContext context, int index) {
                return repoListWidget(theme, index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          );
        },
      ),
    );
  }

  Material repoListWidget(ThemeData theme, int index) {
    return Material(
      child: InkWell(
        splashColor: theme.primaryColor.withOpacity(.5),
        splashFactory: InkSplash.splashFactory,
        borderRadius: BorderRadius.circular(15),
        onTap: () => Get.to(() => RepoDetailView()),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: theme.primaryColor.withOpacity(.5),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                controller.repoList[index].fullName.toString(),
                style: TextStyle(
                  fontSize: MyFonts.headline6TextSize,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
