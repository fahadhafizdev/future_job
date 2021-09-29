import 'package:flutter/material.dart';
import 'package:future_job/models/job.dart';
import 'package:future_job/models/posted.dart';
import 'package:future_job/providers/posted_provider.dart';
import 'package:future_job/theme.dart';
import 'package:future_job/widgets/posted_card.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  final Job job;

  CategoriesPage(this.job);
  @override
  Widget build(BuildContext context) {
    var postedProvider = Provider.of<PostedProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE: HERO IMAGE
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Container(
                height: 270,
                child: Stack(
                  children: [
                    Image.network(
                      job.imageUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: edge, bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.jobName,
                            style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            '1000 available',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Big Companies',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: FutureBuilder<List<Posted>>(
                future: postedProvider.getPostedByCategory(job.jobName),
                builder: (context, snapshot) {
                  // print('THIS IS SNAPSHOT');
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
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'New Startups',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
                  // print('THIS IS SNAPSHOT');
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
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
