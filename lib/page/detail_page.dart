import 'package:flutter/material.dart';
import 'package:future_job/models/posted.dart';
import 'package:future_job/theme.dart';

class DetailPage extends StatefulWidget {
  final Posted postItem;

  DetailPage(this.postItem);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: isClicked ? 80 : 30,
          ),
          isClicked ? Container() : successApplyMessage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                widget.postItem.companyLogo,
                width: 60,
                height: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.postItem.jobName,
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '${widget.postItem.company}, Inc • ${widget.postItem.location}',
                style: lightTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //NOTE:ABOUT THE JOB
                Text(
                  'About the job',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Column(
                  children: widget.postItem.about
                      .map(
                        (aboutItem) => Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/icon_dot.png',
                                height: 12,
                                width: 12,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                aboutItem,
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),

                SizedBox(
                  height: 30,
                ),
                //NOTE:QUALIFICATIONS
                Text(
                  'Qualifications',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  children: widget.postItem.qualifications
                      .map(
                        (qualificationsItem) => Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Image.asset(
                                  'assets/images/icon_dot.png',
                                  height: 12,
                                  width: 12,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 300,
                                child: Text(
                                  qualificationsItem,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),

                SizedBox(
                  height: 30,
                ),
                //NOTE:Responsibilities

                Text(
                  'Responsibilities',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  children: widget.postItem.responsibilities
                      .map(
                        (qualificationsItem) => Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Image.asset(
                                  'assets/images/icon_dot.png',
                                  height: 12,
                                  width: 12,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 300,
                                child: Text(
                                  qualificationsItem,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              style: isClicked ? signInButtonStyle : signInButtonRedStyle,
              onPressed: () {
                setState(() {
                  isClicked = !isClicked;
                  print(isClicked);
                });
              },
              child: Text(
                'Apply for Job',
                style: whiteTextStyle,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Message Recruiter',
              style: lightTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

Widget successApplyMessage() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(
        bottom: 30,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 9),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            49,
          ),
        ),
      ),
      child: Text(
        'You have applied this job and the \nrecruiter will contact you',
        textAlign: TextAlign.center,
        style: lightTextStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
