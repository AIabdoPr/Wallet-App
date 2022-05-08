import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wallet_app/controllers/history.controller.dart';
import 'package:wallet_app/controllers/users.controller.dart';
import 'package:wallet_app/tabs/history.tab.dart';
import 'package:wallet_app/tabs/home.tab.dart';
import 'package:wallet_app/tabs/profile.tab.dart';
import 'package:wallet_app/tabs/users.tab.dart';
import 'package:wallet_app/values.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController tabController;

  List<Widget> tabs = <Widget>[
    const HomeTab(),
    const UsersTab(),
    const HistoryTab(),
    const ProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = PersistentTabController(initialIndex: 0);
    Get.put(UsersController());
    Get.put(HistoryController());
  }

  PersistentBottomNavBarItem _buildNavItem(IconData icon, String name) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: name,
      activeColorPrimary: UIThemeColors.selectedItem,
      inactiveColorPrimary: UIThemeColors.inSelectedItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PersistentTabView(
        context,
        controller: tabController,
        screens: tabs,
        items: [
          _buildNavItem(UIIcons.homeBold, 'Home'),
          _buildNavItem(UIIcons.user1Bold, 'Users'),
          _buildNavItem(UIIcons.chartBold, 'History'),
          _buildNavItem(UIIcons.profileBold, 'Profile'),
        ],
        backgroundColor: UIThemeColors.accent,
        resizeToAvoidBottomInset: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
