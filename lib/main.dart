import 'package:flutter/material.dart';
import 'package:future_job/page/home_page.dart';
import 'package:future_job/page/main_page.dart';
import 'package:future_job/page/sign_in_page.dart';
import 'package:future_job/page/sign_up_page.dart';

import 'package:future_job/page/splash_screen.dart';
import 'package:future_job/page/started_page.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/category_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/providers/posted_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<PostedProvider>(
          create: (context) => PostedProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Future Jobs',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/main-page': (context) => MainPage(),
          '/onboarding': (context) => StartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
