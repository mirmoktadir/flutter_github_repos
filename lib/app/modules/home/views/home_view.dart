import 'package:flutter/material.dart';
import 'package:flutter_github_repos/app/modules/home/views/repo_detail_view.dart';
import 'package:flutter_github_repos/config/theme/light_theme_colors.dart';
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
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
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

  Widget repoListWidget(ThemeData theme, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        child: InkWell(
          splashColor: LightThemeColors.splashColor,
          splashFactory: InkSplash.splashFactory,
          borderRadius: BorderRadius.circular(15),
          onTap: () => Get.to(
              () => RepoDetailView(
                    owner: controller.repoList[index].name.toString(),
                    description:
                        controller.repoList[index].description.toString(),
                    imgUrl:
                        controller.repoList[index].owner!.avatarUrl.toString(),
                  ),
              transition: Transition.leftToRightWithFade,
              duration: const Duration(milliseconds: 600)),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme.primaryColor,
              border: Border.all(
                width: 1,
                color: LightThemeColors.splashColor.withOpacity(.4),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
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
      ),
    );
  }
}
