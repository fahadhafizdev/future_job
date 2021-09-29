import 'package:flutter/material.dart';
import 'package:future_job/models/user_model.dart';
import 'package:future_job/page/home_page.dart';
import 'package:future_job/page/sign_in_page.dart';
import 'package:future_job/providers/auth_provider.dart';
import 'package:future_job/providers/user_provider.dart';
import 'package:future_job/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = true;
  bool _isNameValid = true;
  bool _isPasswordValid = true;
  bool _isGoalValid = true;
  bool _isObscure = true;
  bool _isAddImage = true;

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isLoading = false;

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

    Widget inputName() {
      return TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          hintText: '',
          fillColor: greyColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide(color: mainColor),
          ),
        ),
        style: purpleTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
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

    Widget inputGoal() {
      return TextFormField(
        controller: goalController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18),
          hintText: '',
          fillColor: greyColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            borderSide: BorderSide(color: mainColor),
          ),
        ),
        style: purpleTextStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    //NOTE: MENGEMBANGKAN VALIDATION FORM
    Widget signUpButton() {
      return Container(
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * edge),
        child: ElevatedButton(
          onPressed: () async {
            if (nameController.text.isEmpty ||
                emailController.text.isEmpty ||
                passwordController.text.isEmpty ||
                goalController.text.isEmpty) {
              showError('semua form harus di isi');

              // if (nameController.text.isEmpty) {
              //   setState(() {
              //     _isNameValid = false;
              //   });
              // } else if (passwordController.text.isEmpty) {
              //   setState(() {
              //     _isPasswordValid = false;
              //   });
              // }
            } else {
              setState(() {
                isLoading = true;
              });

              UserModel user = await authProvider.register(
                emailController.text,
                passwordController.text,
                nameController.text,
                goalController.text,
              );

              setState(() {
                isLoading = false;
              });

              if (user == null) {
                showError('email sudah terdaftar');
              } else {
                userProvider.user = user;
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              }
            }
          },
          style: signInButtonStyle,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  'Sign Up',
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
                'Sign Up',
                style: lightTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                'Begin New Journey',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: InkWell(
                  child: Image.asset(
                    _isAddImage
                        ? 'assets/images/user_pic_signup.png'
                        : 'assets/images/user_pic_signup2.png',
                    height: 121.02,
                    width: 112,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    setState(() {
                      _isAddImage = !_isAddImage;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //note:INPUT NAME
              Text(
                'Full Name',
                style: lightTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              inputName(),
              SizedBox(
                height: 8,
              ),

              //NOTE: INPUT EMAIL
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
              //NOTE: INPUT PASSWORD
              Text(
                'Password',
                style: lightTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              inputPassword(),

              SizedBox(
                height: 20,
              ),
              //NOTE: YOUR GOALS
              Text(
                'Your Goal',
                style: lightTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              inputGoal(),
              SizedBox(
                height: 40,
              ),
              //NOTE : BUTTON SIGNUP
              signUpButton(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Back to Sign In',
                    style: lightTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
