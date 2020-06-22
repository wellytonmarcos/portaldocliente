import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const brightness = Brightness.light;
const kPrimaryColor = Color(0xff5D889E);
const kPrimaryColorLight = Color(0xff5D889E);
const kPrimaryColorDark = Color(0xff5D889E);
const kAccentColor = Color(0xFF315C72);
const kOrangeColor = Color(0xFFF9AA33);
const kCanvasColor = Color(0xffF6F6F6);
const kScaffoldBackgroundColor = Color(0xffF6F6F6);

const kWhiteColor = Color(0xFFFFFFFF);
const kBackgroundColor = Color(0xffF6F6F6);

TextStyle gFont({TextStyle myTextStyle}) {
  return GoogleFonts.nunito(
      textStyle: myTextStyle != null ? myTextStyle : TextStyle());
}

ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      button: gFont(),
      caption: gFont(),
      headline1: gFont(),
      headline2: TextStyle(
        fontFamily: "Nunito",
      ),
      headline3: TextStyle(
        fontFamily: "Nunito",
      ),
      headline4: TextStyle(
        fontFamily: "Nunito",
      ),
      headline5: TextStyle(
        fontFamily: "Nunito",
      ),
      overline: TextStyle(
        fontFamily: "Nunito",
      ),
      subtitle1: TextStyle(
        fontFamily: "Nunito",
      ),
      subtitle2: TextStyle(
        fontFamily: "Nunito",
      ),
      bodyText1: TextStyle(
        fontFamily: "Nunito",
      ),
      bodyText2: TextStyle(
        fontFamily: "Nunito",
      ),
    ),
    primaryColor: kPrimaryColor,
    accentColor: kAccentColor,
    scaffoldBackgroundColor: kBackgroundColor,
  );
}
