import 'package:flutter/material.dart';
import 'package:future_job/providers/page_provider.dart';
import 'package:future_job/theme.dart';
import 'package:provider/provider.dart';

class CustomIconNavigation extends StatelessWidget {
  final int index;
  final String imgUrl;

  CustomIconNavigation({this.index, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);

    return GestureDetector(
      onTap: () {
        pageProvider.number = index;
      },
      child: Image.asset(
        imgUrl,
        height: 24,
        width: 24,
        color: (index == pageProvider.number) ? blackColor : lightColor,
      ),
    );
  }
}
