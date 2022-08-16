import '../app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
