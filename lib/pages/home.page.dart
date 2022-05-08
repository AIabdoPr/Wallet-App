import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../tabs/history.tab.dart';
import '../tabs/home.tab.dart';
import '../tabs/profile.tab.dart';
import '../tabs/users.tab.dart';
import '../values.dart';
import '../views/internet_status.view.dart';
import 'page.dart' as page;

class HomePage extends page.Page {
  static const String routeName = "/home";

  HomePage({Key? key}) : super(key: key);

  late PersistentTabController tabController;

  @override
  void initState() {
    tabController = PersistentTabController(initialIndex: 0);
  }

  Widget _buildTab(Widget tab) {
    return Obx(
      () => Flex(
        direction: Axis.vertical,
        children: [
          Flexible(child: SizedBox.expand(child: tab)),
          Container(
            height: 25,
            color: UIThemeColors.bg,
          ),
        ],
      ),
    );
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
  Widget buildBody(BuildContext context) {
    List<Widget> tabs = <Widget>[
      _buildTab(const HomeTab()),
      _buildTab(const UsersTab()),
      _buildTab(const HistoryTab()),
      _buildTab(const ProfileTab()),
    ];
    return Obx(
      () => Stack(
        children: [
          PersistentTabView(
            context,
            controller: tabController,
            screens: tabs,
            navBarHeight: 65,
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
          const InternetStatus(),
        ],
      ),
    );
  }
}
