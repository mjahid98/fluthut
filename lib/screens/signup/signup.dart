import 'dart:convert';

import 'package:fluthut/screens/home/homescreen.dart';
import 'package:fluthut/screens/signin/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluthut/components/socal_icon.dart';
import 'package:http/http.dart' as http;
import 'package:fluthut/size_config.dart';
import 'package:flutter_svg/svg.dart';


import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController ctUsername = TextEditingController();
  TextEditingController ctEmail = TextEditingController();
  TextEditingController ctPassword = TextEditingController();
  TextEditingController ctConfPassword = TextEditingController();
  var msg = '';

  signupReq() async {
    // String url = 'https://happybuy.appsticit.com/user_login';
    String url = 'https://fluthut.oxience.com/wp-json/wc/v3/customers?consumer_key=ck_94287ba676e5be4cc26a4c4dd4e7d738e0abddb3&consumer_secret=cs_725c143ea6f2d8d9e988df7111d21def45c15f6a';
    Uri uri = Uri.parse(url);
    Map data = {
      // 'phone': ctEmail.text,
      'username': ctUsername.text,
      'email': ctEmail.text,
      'password': ctPassword.text,
    };

    var body = json.encode(data);

    var response = await http.post(uri, body: body, headers: {
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Type': 'application/json',
    });

    print(response.statusCode);
    print(response.body);
    var jsonString = jsonDecode(response.body);
    msg = jsonString['message'];
    // if(jsonString['status']=='success'){
    //   Navigator.pop(context);
    //   Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
    // }
    if(jsonString['role'] == 'customer'){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignInScreen()));
    }else if(msg == 'An account is already registered with your email address. <a href=\"#\" class=\"showlogin\">Please log in.</a>'){
        return msg = 'An account is already registered with your email address.';
    }else if(msg == 'An account is already registered with that username. Please choose another.'){
      return msg;
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var isFocusEmail = false;
    var isFocusPass = false;
    var setUsernameIconColor;
    var setEmailIconColor;
    var setPassIconColor;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: percentWidth(8)),
              child: Column(
                children: [
                  SizedBox(height: percentHeight(4)),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(percentWidth(2)),
                        height: percentWidth(22),
                        width: percentWidth(22),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/logos/fluthut-icon-large.png', fit: BoxFit.contain,),

                      ),
                      SizedBox(width: percentWidth(5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          "Let\'s Do It",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: percentWidth(10),
                            fontWeight: FontWeight.bold,

                          ),
                          textAlign: TextAlign.left,


                        ),
                        Text(
                          "Sign Up with unique\nusername, email and password \nor continue with social media",
                          textAlign: TextAlign.left,
                        ),
                      ],),

                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.07),

                  if (msg != null) Text('$msg', textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent),),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  TextField(
                    controller: ctUsername,
                    onTap: () {
                      setState(() {
                        isFocusPass = false;
                        isFocusEmail = true;
                        setEmailIconColor = kPrimaryColor;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Username',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Icon(
                          Icons.alternate_email,
                          color: setEmailIconColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kSecondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  TextField(
                    controller: ctEmail,
                    onTap: () {
                      setState(() {
                        isFocusPass = false;
                        isFocusEmail = true;
                        setEmailIconColor = kPrimaryColor;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Email',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Icon(
                          Icons.email_outlined,
                          color: setEmailIconColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kSecondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  TextField(
                    controller: ctPassword,
                    obscureText: true,
                    onTap: () {
                      setState(() {
                        isFocusPass = true;
                        isFocusEmail = false;
                        setPassIconColor = kPrimaryColor;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Icon(
                          Icons.lock_open_outlined,
                          color: setPassIconColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kSecondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  TextField(
                    controller: ctConfPassword,
                    obscureText: true,
                    onTap: () {
                      setState(() {
                        isFocusPass = true;
                        isFocusEmail = false;
                        setPassIconColor = kPrimaryColor;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Confirm Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Icon(
                          Icons.lock_outlined,
                          color: setPassIconColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kSecondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    height: percentWidth(16),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        primary: Colors.white,
                        backgroundColor: kPrimaryColor,
                      ),
                      onPressed: (){
                        signupReq();
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: percentWidth(5),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalIcon(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: percentHeight(4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignInScreen()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: percentHeight(4)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
