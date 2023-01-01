import 'package:flutter/material.dart';
import 'package:izitscam/util/AppsTheme.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportActivity extends StatelessWidget{
  static const routeName = '/ReportActivity';

  @override
  Widget build(BuildContext context)
  {
    _launchCaller(org) async {
      var url = "";

      if(org == "bnm")
      {
        url = "tel:1300-88-5465";
      } else if(org == "kpdnkk")
      {
       url = "tel:1800-886-800";
      }else{
       url = "tel:603-6204-8000";
      }


      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchEmail(org) async {
      var orgEmail;

      if(org == "bnm")
        {
          orgEmail = "bnmtelelink@bnm.gov.my";
        } else if(org == "kpdnkk")
        {
          orgEmail = "e-aduan@kpdnhep.gov.my";
        }else{
          orgEmail = "";
        }


      var mail = "mailto:$orgEmail?subject=Report suspicious entity";
      if (await canLaunch(mail)) {
        await launch(mail);
      } else {
        throw 'Could not launch $mail';
      }
    }

    //KPDNKK
    _launchBrowser() async
    {
      var open = "https://e-aduan.kpdnhep.gov.my/";
      if (await canLaunch(open)) {
            await launch(open);
    } else {
    throw 'Could not launch $open';
    }
    }


    return Scaffold(
      backgroundColor: AppsTheme.theme1,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor : AppsTheme.theme1,
          title: Text("Report Suspicious Entity"),
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () => {
              Navigator.pop(context),
            },
          )
      ),
      body: Center(
        child: new Form(
            child: Column(
              children: <Widget>[
                Card(
                    child:ListTile(
                      title: Text("BNM TELELINK"
                          ,style: TextStyle(color: AppsTheme.theme3)),
                    ),
                    color:AppsTheme.theme2,
                    ),
                Card(
                  child:ListTile(
                    leading: Icon(Icons.alternate_email,color: Colors.white,),
                    title: Text("bnmtelelink@bnm.gov.my"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                    onTap: ()=>{
                      _launchEmail("bnm"),
                    },
                  ),
                  color:AppsTheme.theme2,
                ),

                Card(
                  child:ListTile(
                    leading: Icon(Icons.phone,color: Colors.white,),
                    title: Text("1300-88-5465"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                    onTap: ()=>{
                      _launchCaller("bnm"),
                    },
                  ),
                  color:AppsTheme.theme2,
                ),
                Card(
                  child:ListTile(
                    title: Text("KPDNKK"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                  ),
                  color:AppsTheme.theme2,
                ),
                Card(
                  child:ListTile(
                    leading: Icon(Icons.alternate_email,color: Colors.white,),
                    title: Text("e-aduan@kpdnhep.gov.my"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                    onTap: ()=>{
                      _launchEmail("kpdnkk"),
                    },
                  ),
                  color:AppsTheme.theme2,
                ),
                Card(
                  child:ListTile(
                    leading: Icon(Icons.phone,color: Colors.white,),
                    title: Text("1800-886-800"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                    onTap: ()=>{
                      _launchCaller("kpdnkk"),
                    },
                  ),
                  color:AppsTheme.theme2,
                ),
                Card(
                  child:ListTile(
                    title: Text("E-ADUAN 2.0"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                    onTap: ()=>{
                     _launchBrowser(),
                    },
                  ),
                  color:AppsTheme.theme2,
                ),

                Card(
                  child:ListTile(
                    title: Text("Suruhanjaya Sekuriti Malaysia"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                  ),
                  color:AppsTheme.theme2,
                ),
                Card(
                  child:ListTile(
                    leading: Icon(Icons.phone,color: Colors.white,),
                    title: Text("03-6204 8000"
                        ,style: TextStyle(color: AppsTheme.theme3)),
                    onTap: ()=>{
                      _launchCaller("sc"),
                    },
                  ),
                  color:AppsTheme.theme2,
                ),

              ],
            )
        ),

      ),
      //   backgroundColor: Color.fromARGB(204, 98, 0, 255)
    );

  }


}