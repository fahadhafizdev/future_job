import 'package:flutter/material.dart';
import 'package:future_job/page/account_page.dart';
import 'package:future_job/page/favorit_page.dart';
import 'package:future_job/page/home_page.dart';
import 'package:future_job/page/notification_page.dart';
import 'package:future_job/providers/page_provider.dart';
import 'package:future_job/theme.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);

    Widget contentSelected(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return NotificationPage();
        case 2:
          return FavoritPage();
        case 3:
          return AccountPage();
        default:
          return HomePage();
      }
    }

    // Widget customButtonNavigation() {
    //   return Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Container(
    //       margin: EdgeInsets.only(top: 30),
    //       child: BottomNavigationBar(
    //         type: BottomNavigationBarType.fixed,
    //         showSelectedLabels: false,
    //         unselectedItemColor: Color(0xffB3B5C4),
    //         selectedItemColor: Color(0xff272C2F),
    //         elevation: 0,
    //         currentIndex: 0,
    //         iconSize: 24,
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage('assets/images/icon_apps.png'),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage('assets/images/icon_notification.png'),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage('assets/images/icon_love.png'),
    //             ),
    //             label: '',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: ImageIcon(
    //               AssetImage('assets/images/icon_user.png'),
    //             ),
    //             label: '',
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 84,
          width: 360,
          color: whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon_apps.png'),
                  ),
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon_apps.png'),
                  ),
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon_apps.png'),
                  ),
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon_apps.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          contentSelected(pageProvider.number),
          customButtonNavigation(),
        ],
      ),
    );
  }
}
