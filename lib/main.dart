import 'package:izitscam/MainActivity/loginActivity.dart';
import 'package:izitscam/ReportActivity/ReportActivity.dart';
import 'package:izitscam/ResultActivity/ResultActivity.dart';
import 'package:flutter/material.dart';
import 'package:izitscam/VictimActivity/VictimActivity.dart';
import 'MainActivity/MainActivity.dart';
import 'ListActivity/ListActivity.dart';
import 'FaqActivity/FaqActivity.dart';
import 'package:izitscam/OnBoardingActivity/OnBoardingActivity.dart';
import 'util/Ads.dart';

Future<void> main() async{

  adsInit();

  runApp(MaterialApp(
    //Home will be onBoarding activity because want to laucnh splash screen.
    //then it will landing to MainActivity. you can check at NavigateAfterSecond
    //inside OnBoardingActivityState
    home: OnBoardingActivityState(),
    routes: {
      //LoginActivityState.routeName : (context) => LoginActivityState(),
      MainActivityState.routeName : (context) => MainActivityState(),
      ListActivityState.routeName: (context) => ListActivityState(),
      ResultActivityState.routeName:(context) => ResultActivityState(),
      FaqActivityState.routeName : (context) => FaqActivityState(),
      ReportActivity.routeName : (context) => ReportActivity(),
      VictimActivityState.routeName : (context) => VictimActivityState(),
    },
  ),);
}