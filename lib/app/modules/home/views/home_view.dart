import 'package:flutter/material.dart';
import 'package:flutter_github_repos/app/data/local/my_shared_pref.dart';
import 'package:flutter_github_repos/app/modules/home/views/repo_detail_view.dart';
import 'package:flutter_github_repos/app/modules/home/views/shimmer/home_view_shimmer.dart';
import 'package:flutter_github_repos/app/services/api_call_status.dart';
import 'package:flutter_github_repos/config/theme/light_theme_colors.dart';
import 'package:flutter_github_repos/config/theme/my_fonts.dart';
import 'package:flutter_github_repos/utils/constants.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
            loadingWidget: () => const HomeViewShimmer(),
            errorWidget: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(AppImages.kErrorIMG),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: const Color(0xFF1D1D26),
                  ),
                  onPressed: () {
                    controller.getData();
                  },
                  child: const Text(
                    "Try again!",
                  ),
                ),
              ],
            ),
            successWidget: () => ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                sortSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                    controller: controller.scrollController,
                    itemCount: controller.repoList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < controller.repoList.length) {
                        return repoListWidget(theme, index);
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Center(
                            child: controller.hasMore
                                ? const CircularProgressIndicator()
                                : const Text("No more data to load"),
                          ),
                        );
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding sortSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 5, top: 5),
      child: Row(
        children: [
          Text(
            "sort with:",
            style: TextStyle(
              fontSize: MyFonts.headline6TextSize,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              MySharedPref.setSort("stars");

              controller.sortAfter();
            },
            child: Row(
              children: [
                const SizedBox(
                  height: 30,
                  child: Icon(
                    Iconsax.star,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 5),
                MySharedPref.getSort() == "stars"
                    ? const Text(
                        'Star',
                        style: TextStyle(color: Colors.orange),
                      )
                    : const Text("Star"),
              ],
            ),
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: () {
              MySharedPref.setSort("time");

              controller.sortAfter();
            },
            child: Row(
              children: [
                const SizedBox(
                  height: 30,
                  child: Icon(
                    Icons.update_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 5),
                MySharedPref.getSort() == "time"
                    ? const Text(
                        'Time',
                        style: TextStyle(color: Colors.orange),
                      )
                    : const Text("Time"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget repoListWidget(ThemeData theme, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        child: InkWell(
          splashColor: LightThemeColors.splashColor,
          splashFactory: InkSplash.splashFactory,
          borderRadius: BorderRadius.circular(12),
          highlightColor: LightThemeColors.splashColor,
          onTap: () => Get.to(
              () => RepoDetailView(
                    time: controller.repoList[index].updatedAt.toString(),
                    owner: controller.repoList[index].name.toString(),
                    description:
                        controller.repoList[index].description.toString(),
                    imgUrl:
                        controller.repoList[index].owner!.avatarUrl.toString(),
                  ),
              transition: Transition.leftToRightWithFade,
              duration: const Duration(milliseconds: 400)),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.primaryColor,
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Center(
                child: Text(
                  controller.repoList[index].fullName.toString(),
                  style: TextStyle(
                    fontSize: MyFonts.headline6TextSize,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
