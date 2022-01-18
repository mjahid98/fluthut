import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFF533DE6);
const kPrimaryLightColor = Color(0x1A727C8E);
const kPrimaryShadowColor = Color(0xB3E7EAF0);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF533DE6), Color(0xFF21C4BF)],
);
const kSecondaryColor = Color(0xFF848484);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: percentWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);