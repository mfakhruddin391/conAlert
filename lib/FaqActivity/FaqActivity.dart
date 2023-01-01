import 'package:flutter/material.dart';
import 'package:izitscam/util/AppsTheme.dart';
import 'package:izitscam/util/custom_expansion_tile.dart' as custom;
import 'package:izitscam/faqActivity/FaqContent.dart';

class FaqActivityState extends StatefulWidget{
  static const routeName = '/FaqContent.faqActivity';
  @override
  createState() => FaqActivity();
}

class FaqActivity extends State<FaqActivityState>{

  @override
  void initState(){
    super.initState();
  }

  var tileExpanded = true;
  var containerColor;
  @override
  // TODO: implement build
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppsTheme.theme1,
        appBar:AppBar(
            centerTitle: true,
            backgroundColor : AppsTheme.theme1,
            title: Text("Faq"),
            //shape:new RoundedRectangleBorder(side: BorderSide(color: Colors.white),borderRadius: new BorderRadius.circular(10.0)),
            leading: IconButton(
              icon: const Icon(Icons.navigate_before),
              onPressed: () => {
                Navigator.pop(context),
              },
            )
        ),
        body: ListView(
         // child: new Form(
             // child: Column(
                children: <Widget>[
                  Card(
                    color:AppsTheme.theme2,
                    child: new Column(
                      children: <Widget>[
                        custom.ExpansionTile(
                          headerBackgroundColor: AppsTheme.theme2,
                          title: Text(FaqContent.faq1Title,style: TextStyle(color: AppsTheme.theme3)),
                          children: <Widget>[
                            Text(FaqContent.faq1Content,style: TextStyle(color: AppsTheme.theme3,fontSize: 15)),
                          ],
                        )
                      ],
                    )
                  ),
                  Card(
                      color:AppsTheme.theme2,
                      child: new Column(
                        children: <Widget>[
                          custom.ExpansionTile(
                            headerBackgroundColor: AppsTheme.theme2,
                            title: Text(FaqContent.faq3Title,style: TextStyle(color: AppsTheme.theme3)),
                            children: <Widget>[
                              Text(FaqContent.faq3Content,style: TextStyle(color: AppsTheme.theme3,fontSize: 15)),
                            ],
                          )
                        ],
                      )
                  ),
                  Card(
                      color:AppsTheme.theme2,
                      child: new Column(
                        children: <Widget>[
                          custom.ExpansionTile(
                            headerBackgroundColor: AppsTheme.theme2,
                            title: Text(FaqContent.faq4Title,style: TextStyle(color: AppsTheme.theme3)),
                            children: <Widget>[
                              Text(FaqContent.faq4Content,style: TextStyle(color: AppsTheme.theme3,fontSize: 15)),
                            ],
                          )
                        ],
                      )
                  ),
                  Card(
                      color:AppsTheme.theme2,
                      child: new Column(
                        children: <Widget>[
                          custom.ExpansionTile(
                            headerBackgroundColor: AppsTheme.theme2,
                            title: Text(FaqContent.faq5Title,style: TextStyle(color: AppsTheme.theme3)),
                            children: <Widget>[
                              Text(FaqContent.faq5Content,style: TextStyle(color: AppsTheme.theme3,fontSize: 15)),
                            ],
                          )
                        ],
                      )
                  ),
                ],
            //  )
         // ),
        ),
      ),



    );
  }



}