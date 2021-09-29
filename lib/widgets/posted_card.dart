import 'package:flutter/material.dart';
import 'package:future_job/models/posted.dart';
import 'package:future_job/page/detail_page.dart';
import 'package:future_job/theme.dart';

class PostedCard extends StatelessWidget {
  final Posted postedModel;

  PostedCard(this.postedModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(postedModel),
          ),
        );
      },
      child: Row(
        children: [
          Image.network(
            postedModel.companyLogo,
            height: 45,
            width: 45,
          ),
          SizedBox(
            width: 27,
          ),
          Container(
            width: 230,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: lightBorderColor, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postedModel.jobName,
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  postedModel.company,
                  style: lightTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 18.5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
