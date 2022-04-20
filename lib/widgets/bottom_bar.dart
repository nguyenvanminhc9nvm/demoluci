import 'package:base_flutter_project/languages/labels.dart';
import 'package:base_flutter_project/theme/theme.dart';
import 'package:flutter/material.dart';

class FlutterBottomBar extends StatelessWidget {
  final Function? onHomeClick;
  final Function? onServiceClick;
  final Function? onGameClick;
  final Function? onGoldClick;
  final Function? onProfileClick;

  const FlutterBottomBar(
      {Key? key,
      this.onHomeClick,
      this.onServiceClick,
      this.onGameClick,
      this.onGoldClick,
      this.onProfileClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemBottomBar(icon: Icons.home, label: Label.home.tr, onTap: onHomeClick),
          _buildItemBottomBar(icon: Icons.miscellaneous_services, label: Label.service.tr, onTap: onServiceClick),
          _buildItemBottomBar(icon: Icons.videogame_asset, label: Label.game.tr, onTap: onGameClick),
          _buildItemBottomBar(icon: Icons.currency_exchange, label: Label.gold.tr, onTap: onGoldClick),
          _buildItemBottomBar(icon: Icons.person, label: Label.profile.tr, onTap: onProfileClick),
        ],
      ),
    );
  }

  Widget _buildItemBottomBar({IconData? icon, String label = "", Function? onTap}) {
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: () => onTap?.call(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO: Update icon
          Icon(icon ?? Icons.home, size: 28.0),
          Text(label, style: AppTextStyle.textStyleItemBottomBar)
        ],
      ),
    );
  }
}
