import 'package:flutter/material.dart';
import 'package:izitscam/MainActivity/MainActivity.dart';
import 'package:izitscam/util/Ads.dart';
import 'package:izitscam/util/AppsTheme.dart';
import 'package:izitscam/Route.dart';
//Use containerColor to check widget position by put color in there
// Ex: containerColor = Colors.white
var containerColor;
var websiteName = [];

  class LoginActivityState extends StatefulWidget{
    static const routeName = '/login';
    @override
    createState() => LoginActivity();
  }


class LoginActivity extends State<LoginActivityState> {
  @override
  void initState(){
    bannerAd();
    super.initState();
    //Load banner
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppsTheme.theme1,
      body: Center(
        child: new Form(
            child: Column(
              children: <Widget>[

                Container(height: 80.0,
                    width: 120.0,

                    color: containerColor),
                Container(
                  color: AppsTheme.theme1,
                  child: Column(
                    children: [
                      Image.asset('lib/img/logo2.png',height: 170.0,),
                    ],
                  ),
                ),

                Text(
                  "ConAlert",
                  style: TextStyle(fontSize: 50,color:AppsTheme.theme3,fontFamily: 'payrus'),),
                Container(height: 40.0,
                    width: 100.0,
                    color: containerColor),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: AppsTheme.theme3),
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: AppsTheme.theme3),

                  ),
                ),
                Card(
                    child:ListTile(
                      title: Text("LOGIN",style: TextStyle(color: AppsTheme.theme3),textAlign:TextAlign.center),
                      onTap: ()=>{
                        //interstitialAd(),
                        // Navigator.pushNamed(context,ListActivityState.routeName),
                        Navigator.of(context).push(createRoute(MainActivityState()))
                      },
                    ),
                    color:AppsTheme.theme2,
                    shape:new RoundedRectangleBorder(side: BorderSide(color: AppsTheme.theme3),borderRadius: new BorderRadius.circular(20.0))),

                ],
            )
        ),

      ),
      //   backgroundColor: Color.fromARGB(204, 98, 0, 255)
    );

  }

}

