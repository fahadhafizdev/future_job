import 'package:flutter/material.dart';
import 'package:future_job/page/account_page.dart';
import 'package:future_job/page/favorit_page.dart';
import 'package:future_job/page/home_page.dart';
import 'package:future_job/page/notification_page.dart';
import 'package:future_job/providers/page_provider.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/custom_navigation_icon.dart';
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
              CustomIconNavigation(
                index: 0,
                imgUrl: 'assets/images/icon_apps.png',
              ),
              CustomIconNavigation(
                index: 1,
                imgUrl: 'assets/images/icon_notification.png',
              ),
              CustomIconNavigation(
                index: 2,
                imgUrl: 'assets/images/icon_love.png',
              ),
              CustomIconNavigation(
                index: 3,
                imgUrl: 'assets/images/icon_user.png',
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
