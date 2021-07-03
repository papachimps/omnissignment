import 'package:flutter/material.dart';

const kWhiteBgColor = Color(0xffFDFDFD);
const kButtonColor = Color(0xff5DBBD5);
const kDarkBlueColor = Color(0xff2B2C5C);
const kTextFieldBorderColor = Color(0xffD5D5DF);
const kDefaultFontColor = Color(0xff222222);

const double kDefaultMargin = 16;
const double kDefaultMargin2 = 24;

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: kDefaultMargin2,
  fontWeight: FontWeight.w500,
  color: kDefaultFontColor,
);

const TextStyle kSubTitleTextStyle = TextStyle(
  fontSize: kDefaultMargin,
  fontWeight: FontWeight.w400,
  color: kDefaultFontColor,
);

const TextStyle kHintTextStyle = TextStyle(
  fontSize: kDefaultMargin - 2,
  fontWeight: FontWeight.w300,
  color: kTextFieldBorderColor,
);

const TextStyle kTextButtonTextStyle = TextStyle(
  fontSize: kDefaultMargin - 2,
  fontWeight: FontWeight.w400,
  color: kButtonColor,
);

const kInputTextFieldDecoration = InputDecoration(
  hintStyle: kHintTextStyle,
  contentPadding: EdgeInsets.symmetric(
      vertical: kDefaultMargin2, horizontal: kDefaultMargin),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kDefaultMargin)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kTextFieldBorderColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kDefaultMargin)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kTextFieldBorderColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(kDefaultMargin)),
  ),
);
