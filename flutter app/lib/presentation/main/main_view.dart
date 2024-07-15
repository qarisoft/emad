import 'package:emad_app/presentation/main/pages/home/view/home_page.dart';
import 'package:emad_app/presentation/main/pages/notifications/notifications_page.dart';
import 'package:emad_app/presentation/main/pages/search/search_page.dart';
import 'package:emad_app/presentation/main/pages/settings/settings_page.dart';
import 'package:emad_app/presentation/resources/color_manager.dart';
import 'package:emad_app/presentation/resources/strings_manager.dart';
// import 'package:emad_app/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationsPage(),
    const SettingsPage()
  ];
  List<String> titles = [
    AppStrings.home.tr(),
    AppStrings.search.tr(),
    AppStrings.products.tr(),
    AppStrings.settings.tr(),
  ];

  var _title = AppStrings.home.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: Theme.of(context).textTheme.titleSmall),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        // selectedItemColor: ColorManager.primary,
        // unselectedItemColor: ColorManager.grey,
        // currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          CurvedNavigationBarItem(
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 0 ? ColorManager.primary : Colors.black54,
                    BlendMode.srcIn),
              ),
              label: titles[0]),
          CurvedNavigationBarItem(
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 0 ? ColorManager.primary : Colors.black54,
                    BlendMode.srcIn),
              ),
              label: titles[1]),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(
              'assets/icons/order.svg',
              colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? ColorManager.primary : Colors.black54,
                  BlendMode.srcIn),
            ),
            label: titles[2],
          ),
          CurvedNavigationBarItem(
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: ColorFilter.mode(
                    _currentIndex == 0 ? ColorManager.primary : Colors.black54,
                    BlendMode.srcIn),
              ),
              label: titles[3]),
        ],
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
