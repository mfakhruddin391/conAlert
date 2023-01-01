
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izitscam/MainActivity/MainActivity.dart';
import 'package:izitscam/MainActivity/loginActivity.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:izitscam/util/AppsTheme.dart';

class OnBoardingActivityState extends StatefulWidget {
  @override
  createState() => OnBoardingActivity();
}

class OnBoardingActivity extends State<OnBoardingActivityState> {

  @override
  Widget build(BuildContext context)
  {
    return new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: MainActivityState(),
       // image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        image : Image.asset('lib/img/logo2.png',height: 170.0,),
        backgroundColor: AppsTheme.theme2,
        loadingText: new Text('Powered By Gregartech Industries',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color:AppsTheme.theme3,
        ),),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: AppsTheme.theme3
    );
  }


}