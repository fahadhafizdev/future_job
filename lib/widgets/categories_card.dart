import 'package:flutter/material.dart';
import 'package:future_job/models/job.dart';
import 'package:future_job/models/posted.dart';
import 'package:future_job/page/categories_page.dart';
import 'package:future_job/theme.dart';

class CategoriesCard extends StatelessWidget {
  final Job job;

  CategoriesCard(this.job);

  // final String name;
  // final String imageUrl;

  // CategoriesCard({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesPage(job),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            Image.network(job.imageUrl),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 150,
                padding: EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                  right: 42,
                ),
                child: Text(
                  job.jobName,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
