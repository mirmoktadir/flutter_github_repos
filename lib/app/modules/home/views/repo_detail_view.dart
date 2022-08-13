import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RepoDetailView extends GetView {
  const RepoDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RepoDetailView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView());
  }
}
