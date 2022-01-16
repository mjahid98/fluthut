import 'dart:convert';

import 'package:fluthut/screens/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fluthut/components/socal_icon.dart';
import 'package:http/http.dart' as http;
import 'package:fluthut/size_config.dart';
import 'package:flutter_svg/svg.dart';


import '../../constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  var ctEmail = TextEditingController();
  var ctPassword = TextEditingController();
  var msg = '';

  loginReq() async {
    // String url = 'https://happybuy.appsticit.com/user_login';
    String url = 'https://fluthut.oxience.com/wp-json/jwt-auth/v1/token';
    Uri uri = Uri.parse(url);
    Map data = {
      // 'phone': ctEmail.text,
      'username': ctEmail.text,
      'password': ctPassword.text,
    };

    var body = json.encode(data);

    var response = await http.post(uri, body: body, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Content-Type': 'application/json',
    });

    print(response.statusCode);
    print(response.body);
    var jsonString = jsonDecode(response.body);
    msg = jsonString['msg'];
    // if(jsonString['status']=='success'){
    //   Navigator.pop(context);
    //   Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
    // }
    if(jsonString['status']=='success'){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var isFocusEmail = false;
    var isFocusPass = false;
    var setEmailIconColor;
    var setPassIconColor;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(8)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: percentWidth(5)),
                    padding: EdgeInsets.all(percentWidth(10)),
                    height: percentWidth(45),
                    width: percentWidth(45),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/logos/fluthut-icon-large.png', fit: BoxFit.contain,),

                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),

                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: percentWidth(10),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  // SignForm(),
                  TextField(
                    controller: ctEmail,
                    onTap: () {
                      setState(() {
                        isFocusPass = false;
                        isFocusEmail = true;
                        setPassIconColor = kPrimaryColor;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Email',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Icon(
                          Icons.email_outlined,
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
                    controller: ctPassword,
                    obscureText: true,
                    onTap: () {
                      setState(() {
                        isFocusPass = true;
                        isFocusEmail = false;
                        setEmailIconColor = kPrimaryColor;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10),
                        child: Icon(
                          Icons.lock_outlined,
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
                        loginReq();
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: percentWidth(5),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
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
                  SizedBox(height: percentHeight(8)),
                  // NoAccountText(),
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
