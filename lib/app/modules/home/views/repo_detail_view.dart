import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_repos/config/theme/my_fonts.dart';
import 'package:flutter_github_repos/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RepoDetailView extends GetView {
  final String time;
  final String owner;
  final String description;
  final String imgUrl;

  const RepoDetailView(
      {Key? key,
      required this.time,
      required this.owner,
      required this.description,
      required this.imgUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Repo Detail View'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              header(theme),
              const SizedBox(height: 25),
              detail(theme),
            ],
          ),
        ));
  }

  Widget header(ThemeData theme) {
    return Container(
      color: theme.cardColor.withOpacity(.5),
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
              child: SizedBox(
            height: 60.h,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              errorWidget: (context, _, error) => Image.asset(
                AppImages.kIcon,
                fit: BoxFit.cover,
              ),
            ),
          )),
          const SizedBox(width: 25),
          SizedBox(
            width: 190.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  owner,
                  style: TextStyle(
                    fontSize: MyFonts.headline5TextSize,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'updated at :${DateFormat('MM-dd-yy   hh:mm a').format(DateTime.parse(time))} ',
                  style: TextStyle(
                    fontSize: MyFonts.body3TextSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget detail(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: theme.cardColor.withOpacity(.5),
      child: Text(
        description,
        style: TextStyle(
          fontSize: MyFonts.headline6TextSize,
        ),
        maxLines: 12,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

// Details page shows repo owner's name, photo, repository's description,
// last update date time in month-day-year hour:seconds format, each field in 2 digit numbers and any other fields you want
