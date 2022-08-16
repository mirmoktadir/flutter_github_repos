import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../config/theme/my_fonts.dart';

class HomeViewShimmer extends StatelessWidget {
  const HomeViewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.primaryColor.withOpacity(.5),
      highlightColor: theme.primaryColor.withOpacity(.2),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Material(
              child: InkWell(
                splashColor: LightThemeColors.splashColor,
                splashFactory: InkSplash.splashFactory,
                borderRadius: BorderRadius.circular(12),
                highlightColor: LightThemeColors.splashColor,
                onTap: () {},
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Center(
                      child: Text(
                        'jhone Doe',
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
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}
