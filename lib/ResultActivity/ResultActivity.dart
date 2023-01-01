import 'package:flutter/material.dart';
import 'package:izitscam/backend/CompanyListModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultActivityState extends StatefulWidget{
  static const routeName = '/ResultActivityState';
  @override
  createState() => ResultActivity();
}

class ResultActivity extends State<ResultActivityState>{

  @override
  void initState(){
    super.initState();
  }


  var buildActivity = false;
  var targetedEntity = [Card()];
  var webList = '';

  _launchBrowser(link) async
  {
    var getLink = "$link";
    if (await canLaunch(getLink)) {
      await launch(getLink);
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    //To access the CompanyListModel, use the ModalRoute.of() method. This method returns the current route with the arguments.
    final CompanyListModel args = ModalRoute.of(context).settings.arguments;

  _fetchEntity() {
     setState(() {
       targetedEntity.clear();
       webList = '';

       //Company Name
       targetedEntity.add(Card(
         child: ListTile(
           leading: Icon(Icons.home),
           title: Text(': ${args.companyName}'),
         ),));

       //Date Added inside BNM db
       /*
       targetedEntity.add( Card(
         child: ListTile(
           leading: Icon(Icons.calendar_today),
           title: Text(': ${args.addedDate}'),
         ),),);
*/
       args.listedWebsite.forEach((element) {
         targetedEntity.add( Card(
           child: ListTile(
             leading: Icon(Icons.link),
             title: Text(element),
             onTap: (){
              _launchBrowser(element);
             },
           ),
         ),);
       });

       //Website list.




       targetedEntity.add(
         Card(
           clipBehavior: Clip.antiAlias,
           child: Column(
             children: [
               ListTile(
                 title: Center(child: const Text(
                     'status :',
                   style: TextStyle(fontSize: 20,),
                 ),
               ),),
               Icon(Icons.warning,color:Colors.red,size: 100,),
             ],
           ),
         ),);

       targetedEntity.add( Card(
         child: ListTile(
           leading: Icon(Icons.info,color:Colors.red),
           title: Text("${args.companyName} is unauthorized and unregulated by Bank Negara Malaysia.",style:TextStyle(fontWeight: FontWeight.bold)),
         ),),);

       targetedEntity.add(Card(
         child: ListTile(
           leading: Icon(Icons.info,color:Colors.red),
           title: Text("Your are high at risk."),
         ),),);

       targetedEntity.add(Card(
         child: ListTile(
           leading: Icon(Icons.info,color:Colors.red),
           title: Text("Please avoid from dealing with the company."),
         ),),);


     });
  }

_fetchEntity();

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: args.isDanger? Colors.red : Color(0xFF6200EE),
              title: Text("Entity Information"),
              leading: IconButton(
                icon: const Icon(Icons.navigate_before),
                onPressed: () =>
                {
                  Navigator.pop(context),
                },
              )
          ),
          body: ListView(
            children: [
              Center(
                child: new Form(
                  child: Column(
                      children: targetedEntity
                  ),
                ),
              ),


            ],

          ),
          // backgroundColor: Color(0xFF6200EE),
        ),

      );

  }


}