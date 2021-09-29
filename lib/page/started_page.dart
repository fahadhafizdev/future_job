import 'package:flutter/material.dart';
import 'package:future_job/page/sign_in_page.dart';
import 'package:future_job/page/sign_up_page.dart';
import 'package:future_job/theme.dart';

class StartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg_signin.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 20,
                top: 50,
              ),
              child: Text(
                'Build Your Next \nFuture Career Like' + '\na Master',
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 20,
              ),
              child: Text(
                '18,000 jobs available',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - (2 * 90),
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  style: raisedButtonStyle,
                  child: Text(
                    'Get Started',
                    style: purpleTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - (2 * 90),
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  },
                  style: raisedButtonStyle2,
                  child: Text(
                    'Sign In',
                    style: whiteTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ]),
    );
  }
}
