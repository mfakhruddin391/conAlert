import 'package:flutter/material.dart';
import 'package:izitscam/ResultActivity/ResultActivity.dart';
import 'package:izitscam/backend/consumerAlert.dart';
import 'package:izitscam/backend/CompanyListModel.dart';
import 'package:izitscam/util/AppsTheme.dart';

class ListActivityState extends StatefulWidget{
  static const routeName = '/ListActivityState';
  @override
  createState() => ListActivity();
}

class ListActivity extends State<ListActivityState>{

  @override
  void initState(){
    super.initState();
  }



  var companyList = [Card()];
  var storeEntities= [];
  var searchedEntities = [];

 _updateCardList()
 {
   //Limit the list only appear for 20 list only to avoid lag.
   for(int i =0;i<20;i++)
   {
     setState(() {
     var newKey;
     newKey = new Key(i.toString());
     companyList.add(
         Card(key: newKey,
             child:ListTile(
                 title: Text(searchedEntities[i].companyName,style: TextStyle(color: AppsTheme.theme3),),
               onTap: ()=>{

                   Navigator.pushNamed(context,ResultActivityState.routeName,
                       arguments: CompanyListModel.forPassArgs(
                           searchedEntities[i].id,
                           searchedEntities[i].companyName,
                           searchedEntities[i].addedDate,
                           searchedEntities[i].companyWebsite,
                           true)),
               },
             ),
         color:AppsTheme.theme2,
         shape:new RoundedRectangleBorder(side: BorderSide(color: AppsTheme.theme3),borderRadius: new BorderRadius.circular(20.0))
         )
     );
     });

   }
 }

  _updateEntitiesList(){

    consumerAlert().then((res)=>
    {
        storeEntities = res.toSet().toList(),

    });
}

  _searchEntities(String search)
  {
    setState(() {

      //Every new keyword insert by user, this array will be clear .
      searchedEntities.clear();
      companyList.clear();

    });

    //Convert to uppercase
    var searchConvert = search.toUpperCase();
    var websiteUpperCase;
    //1. execute search operation , based on search parameter on _searchEntities function.
    //2. Once found, store first in array searchedEntities
    //3. After that , bind to card widget by call the _updateCardList(); function

      for(var res in storeEntities)
      {
        for(var webList in res.companyWebsite) {

          websiteUpperCase = webList.toUpperCase();

          if (res.companyName.contains(searchConvert) == true ||websiteUpperCase.contains(searchConvert) == true || res.addedDate.contains(searchConvert)) {
            searchedEntities.add(res);
            break;
          }
        }
      }
      _updateCardList();
  }

  @override
  Widget build(BuildContext context){



    return MaterialApp(

      home: Scaffold(
          backgroundColor : AppsTheme.theme1,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor : AppsTheme.theme1,
            title: Text("Search Entities"),
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () => {
              Navigator.pop(context),
            },
          )
      ),
        body: ListView(

          children: [
            Container(
              decoration: BoxDecoration(color: AppsTheme.theme2),
              child: TextFormField(
              style:TextStyle(color:AppsTheme.theme3),

              initialValue: '',
              onChanged: (e)=>{
                  _searchEntities(e),
              },
              onTap:()=>{
              //Update the list of entities when user tap the search box
              _updateEntitiesList(),
                },
              cursorColor: Theme.of(context).backgroundColor,
              decoration: InputDecoration(
                labelText: 'Business/Company Name or License Number or Website',
                labelStyle: TextStyle(color: AppsTheme.theme3,fontSize: 13),
              ),

            ),),



            Center(
              child: new Form(
                  child: Column(
                    children: companyList,
                  )
              ),
            ),


          ],
        )
    ));
  }


}