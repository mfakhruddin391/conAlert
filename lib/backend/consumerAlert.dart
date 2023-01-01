import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:izitscam/backend/CompanyListModel.dart';



Future <List<dynamic>>  consumerAlert() async {
  var response = await http.get(
      Uri.encodeFull("https://api.bnm.gov.my/public/consumer-alert"),
      headers: {
        "Accept":"application/vnd.BNM.API.v1+json",
      }
  );

  var parseJson = json.decode(response.body);
  List<CompanyListModel> companyList = [];
  var ID_NO = 1;

  for(var obj in parseJson['data']) {
    //print(obj['name']);
    var companyObj = new CompanyListModel.forModel();
    companyObj.id= ID_NO;
    companyObj.companyName = obj['name'].toLowerCase().toUpperCase();

    if(obj['added_date'] != null || obj['added_date'] != '')
      {
        companyObj.addedDate = obj['added_date'];
      }

    //Filter
    RegExp reg = new RegExp("http|www|.com|.blogspot|.weebly|.wordpress",caseSensitive: false,multiLine: true);

    //Since one company have multiple website , we need to sort it in array back
    //it is hard because BNM data is really messy >:(, they dont list it in array some of their data.
    for(var webArr in obj['websites']) {

      //Will determine either the official website is just a title or a real website/Facebook Page/Blog-based
      if (reg.hasMatch(webArr)) {

        //Replace space bar with commas, so the for loop can read it as 1 value per commas
        var organized = webArr.replaceAll(" ", ",");
        var splitToArr = organized.split(",");

        for(var splited in splitToArr){

          //Value inside website property array is not 0 or else, must have value
          if(splited != '')
          {
            companyObj.companyWebsite.add(splited);
          }
        }

      } else {
        companyObj.companyWebsite.add(webArr);
        // print("Website else :$webArr");
      }
      //Store each of object array in array;
      companyList.add(companyObj);
    }
    ID_NO++;
  }

  return Future.value(companyList);
}