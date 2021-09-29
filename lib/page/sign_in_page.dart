import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:future_job/page/home_page.dart';
import 'package:future_job/page/sign_up_page.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = true;
  bool _isObscure = true;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String messege) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redColor,
          content: Text(messege),
        ),
      );
    }

    Widget inputEmail() {
      return TextFormField(
        controller: emailController,
        onChanged: (value) {
          print(value);
          bool isValid = EmailValidator.validate(value);
          print(isValid);
          if (isValid) {
            setState(() {
              isEmailValid = true;
            });
          } else {
            setState(() {
              isEmailValid = false;
            });
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                100,
              ),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: isEmailValid
                ? BorderSide(color: mainColor)
                : BorderSide(color: redColor),
          ),
          fillColor: greyColor,
          filled: true,
          hintText: '',
        ),
        style: purpleTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: !isEmailValid ? redColor : mainColor),
      );
    }

    Widget inputPassword() {
      return TextFormField(
        controller: passwordController,
        obscureText: _isObscure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                100,
              ),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                100,
              ),
            ),
            borderSide: BorderSide(color: mainColor),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: mainColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          fillColor: greyColor,
          filled: true,
          hintText: '',
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * edge),
        child: ElevatedButton(
          onPressed: () async {
            if (emailController.text.isEmpty ||
                passwordController.text.isEmpty) {
              showError('form email dan password belum di isi');
            } else {
              setState(() {
                isLoading = true;
              });

              UserModel user = await authProvider.login(
                emailController.text,
                passwordController.text,
              );

              setState(() {
                isLoading = false;
              });

              if (user == null) {
                showError('login gagal, periksa kembali form anda');
              } else {
                userProvider.user = user;
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main-page', (route) => false);
              }
            }
          },
          style: signInButtonStyle,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  'Sign In',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Sign In',
                style: lightTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                'Build Your Career',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  'assets/images/hero_signin.png',
                  height: 240,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //NOTE:FIELD INPUT EMAIL, PASSWORD
              Text(
                'Email Address',
                style: lightTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              inputEmail(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: lightTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              inputPassword(),
              SizedBox(
                height: 40,
              ),
              signInButton(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Create New Account',
                    style: lightTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
