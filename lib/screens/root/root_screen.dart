import 'package:base_flutter_project/screens/home/home_screen.dart';
import 'package:base_flutter_project/screens/root/controller/root_controller.dart';
import 'package:base_flutter_project/screens/root/root_tab.dart';
import 'package:base_flutter_project/theme/theme.dart';
import 'package:base_flutter_project/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildContent(),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Obx(() {
      return SafeArea(
        child: IndexedStack(
          index: controller.currentTab.value.index,
          children: [
            HomeScreen(screenName: "Home"),
            HomeScreen(screenName: "Service"),
            HomeScreen(screenName: "Game"),
            HomeScreen(screenName: "Gold"),
            HomeScreen(screenName: "Profile"),
          ],
        ),
      );
    });
  }

  Widget _buildBottomBar() {
    return FlutterBottomBar(
      onHomeClick: () {
        controller.currentTab.value = RootTab.Home;
      },
      onServiceClick: () {
        controller.currentTab.value = RootTab.Service;
      },
      onGameClick: () {
        controller.currentTab.value = RootTab.Game;
      },
      onGoldClick: () {
        controller.currentTab.value = RootTab.Gold;
      },
      onProfileClick: () {
        controller.currentTab.value = RootTab.Profile;
      },
    );
  }
}
