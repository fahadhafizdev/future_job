import 'package:flutter/material.dart';
import 'package:future_job/models/job.dart';
import 'package:future_job/models/posted.dart';
import 'package:future_job/providers/category_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/providers/posted_provider.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/categories_card.dart';
import 'package:future_job/widgets/posted_card.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var postedProvider = Provider.of<PostedProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),

            //NOTE : PROFILE
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 20,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy',
                        style: lightTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        userProvider.user.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/user_pic_signup2.png',
                    height: 58,
                    width: 58,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: HOT CATEGORIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Hot Categories',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(left: edge),
              height: 200,
              child: FutureBuilder<List<Job>>(
                  future: categoryProvider.getCategories(),
                  builder: (context, snapshot) {
                    // print(snapshot.data);

                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data
                            .map(
                              (category) => CategoriesCard(category),
                            )
                            .toList(),
                        // children: [
                        //   CategoriesCard(
                        //     Job(
                        //       id: 1,
                        //       jobName: 'Mobile Developer',
                        //       imageUrl: 'assets/images/pic_categories1.png',
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     width: 16,
                        //   ),
                        //   CategoriesCard(
                        //     Job(
                        //       id: 2,
                        //       jobName: 'App Designer',
                        //       imageUrl: 'assets/images/pic_categories2.png',
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     width: 16,
                        //   ),
                        //   CategoriesCard(
                        //     Job(
                        //       id: 3,
                        //       jobName: 'Content Writer',
                        //       imageUrl: 'assets/images/pic_categories3.png',
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     width: 16,
                        //   ),
                        //   CategoriesCard(
                        //     Job(
                        //       id: 4,
                        //       jobName: 'Video Grapher',
                        //       imageUrl: 'assets/images/pic_categories4.png',
                        //     ),
                        //   ),
                        // ],
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: POSTED
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Just Posted',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
                padding: EdgeInsets.only(left: edge),
                child: FutureBuilder<List<Posted>>(
                  future: postedProvider.getPosted(),
                  builder: (context, snapshot) {
                    // print('this is snapshot');
                    // print(snapshot.data);
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: snapshot.data
                            .map(
                              (post) => Container(
                                margin: const EdgeInsets.only(bottom: 26.5),
                                child: PostedCard(post),
                              ),
                            )
                            .toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
